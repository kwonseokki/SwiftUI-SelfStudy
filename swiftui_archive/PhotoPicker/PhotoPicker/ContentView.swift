//
//  ContentView.swift
//  PhotoPicker
//
//  Created by 권석기 on 9/15/24.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var seletedItems: [PhotosPickerItem] = []
    @State private var seletedImages: [UIImage] =  []
    
    var body: some View {
        VStack {
            Section {
                PhotosPicker(selection: $seletedItems, maxSelectionCount: 3, matching: .images) {
                    Text("Selecte Photos")
                }
                .onChange(of: seletedItems, perform: { value in
                    loadSelectedPhotos2()
                })
            }
            
            imagesSection
        }
    }
    
    private var imagesSection: some View {
        Section {
            ForEach(seletedImages, id: \.self) { image in
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.vertical, 10)
            }
        }
    }
        
    @MainActor
    func loadSelectedPhotos2() {
        Task {
            for photoItem in seletedItems {
                // 한개의 작업이 끝날때까지 기다리고 다음작업 처리
                if let imageData = try await photoItem.loadTransferable(type: Data.self),  let image = UIImage(data: imageData) {
                    print(Thread.isMainThread)
                    seletedImages.append(image)
                }
            }
        }
    }
    
    func loadSeletedPhotos() {
        Task {
            // 여러개의 비동기처리를 처리할때 withTaskGroup
            // 모든 작업을 병렬적으로 처리한다.
            await withTaskGroup(of: (UIImage?, Error?).self) { taskGroup in
                for photoItem in seletedItems {
                    // child Task 추가
                    // 해당 Task가 모두 끝난 결과를 받을수있다
                    taskGroup.addTask {                        
                        do {
                            if let imageData = try await photoItem.loadTransferable(type: Data.self) {
                                let image = UIImage(data: imageData)
                                return (image, nil)
                            }
                            return (nil, nil)
                        } catch {
                            return (nil, error)
                        }
                    }
                }
                
                
                for await result in taskGroup {
                    if let error = result.1 {
                        break
                    } else if let image = result.0 {
                        print("이미지추가")
                        DispatchQueue.main.async {
                            seletedImages.append(image)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
