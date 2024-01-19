//
//  ContentView.swift
//  Navigation
//
//  Created by SeokKi Kwon on 2024/01/20.
//

import SwiftUI

struct Detail: View {
    var number: Int
    
    var body: some View {
        Text("Detail View")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

struct DetailView: View {
    var number: Int
//    @Binding var path: NavigationPath
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            
    }
}

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path:"SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        path = NavigationPath()
    }
    
    func save() {
        guard let representation = path.codable else { return }
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

struct ContentView: View {
//    @State private var path = [Int]()
//    @State private var path = NavigationPath()
    @State private var pathStore = PathStore()
    // 화면이 계속 중첩되는 구조 루트뷰로 돌아가기 위해서는 값을 바인딩 하거나 뷰모델 선언
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(number: 0)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i)
                }
        }
//        NavigationStack(path: $path) {
//                DetailView(number: 0, path: $path)
//                .navigationDestination(for: Int.self) { i in
//                    DetailView(number: i, path: $path)
//                }
//        }
//        NavigationStack(path: $path) {
//            List {
//                ForEach(0..<5) { i in
//                    NavigationLink("Selected Number: \(i)", value: i)
//                }
//                
//                ForEach(0..<5) { i in
//                    NavigationLink("Selected Number: \(i)", value: String(i))
//                }
//            }
//            .navigationDestination(for: Int.self) { selection in
//                Text("You seleted the number \(selection)")
//            }
//            
//            .navigationDestination(for: String.self) { selection in
//                Text("You seleted the string \(selection)")
//            }
//            .toolbar {
//                Button("Push 556") {
//                    // 3개의 화면이 경로에 push됨
//                    path.append(556)
//                    path.append(557)
//                    path.append(558)
//                }
//                
//                Button("Push Hello") {
//                    path.append("Hello")
//                }
//            }
//        }
        
        
        /**
         사용자 입력을 처리하는중이고 해당 작업이 완료되면 결과 화면으로 이동할떄 자동으로 이동을 원하는 경우?
         
            뒤로 버튼을 누르면 path 배열에서 경로가 사라짐
         */
//        NavigationStack(path: $path) {
//            VStack {
//                // 경로에 32를 추가
//                Button("Show 32") {
//                    path = [32]
//                }
//                
//                Button("Show 64") {
//                    path.append(64)
//                }
//                
//                Button("Show 32 then 64") {
//                    path = [32, 64]
//                }
//            }
//            .navigationDestination(for: Int.self) { selection in
//                Text("You selected \(selection)")
//            }
//            
            
            
            /**
             ## NavigationDestination을 사용
             - 탐색할 데이터가 여러개인 경우 navigationDestinatin() 수정자만 추가하면됨
             - 데이터가 많은 경우 적합
             
             */
            //            List(0..<100) { i in
            //                NavigationLink("Selet \(i)", value: i)
            //            } // 정수를 받는 경우 Detail 화면으로 이동
            //            .navigationDestination(for: Int.self) { i in
            //                Detail(number: i)
            //            }
            
            /**
             ## NavigationLink 만을 사용
             - NavigationLink를 사용할때 화면을 이동하지 않아도 Detail 인스턴스가 생성됨(문제점)
             */
            //            List(0..<100) { i in
            //                NavigationLink(destination: Detail(number: i)) {
            //                    Text("Seleted \(i)")
            //                }
            //            }
            
        }
    }


#Preview {
    ContentView()
}
