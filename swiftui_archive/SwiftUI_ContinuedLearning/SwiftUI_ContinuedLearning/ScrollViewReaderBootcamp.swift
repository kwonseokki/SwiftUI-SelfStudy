//
//  ScrollViewReaderBootcamp.swift
//  SwiftUI_ContinuedLearning
//
//  Created by SeokKi Kwon on 2023/12/23.
//

import SwiftUI

// 뷰빌더가 실행되는 도중에 사용할 수 없다 제스쳐 핸들러 및 onChange 메서드와 같이 컨텐츠 내에서 생성된 액션에서만 프록시 호출이 가능
struct ScrollViewReaderBootcamp: View {
    @State var textFieldText: String = ""
    @State var scrollToIndex: Int = 0
    var body: some View {
        VStack {
            TextField(text: $textFieldText) {
                Text("Enter a # here...")
            }
            .frame(height: 55)
            .border(.gray)
            .padding(.horizontal)
            .keyboardType(.numberPad)
            
            // 이동할 스크롤 번호 설정
            Button(action: {
                    guard let index = Int(textFieldText) else { return }
                    scrollToIndex = index
            }, label: {
                Text("SCROLL NOW")
            })
            
                ScrollViewReader { proxy in
                    ScrollView {
                    ForEach(0..<50) { index in
                            Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                            .padding()
                            .id(index)
                    }
                    // 스크롤 번호 변화가 감지되면 해당 스크롤로 이동
                    .onChange(of: scrollToIndex) { value in
                        withAnimation {
                            proxy.scrollTo(value, anchor: nil)
                        }
                        
                    }
                }
               
            }
        }
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}
