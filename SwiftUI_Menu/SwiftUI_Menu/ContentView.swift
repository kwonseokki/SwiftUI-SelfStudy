//
//  ContentView.swift
//  SwiftUI_Menu
//
//  Created by SeokkiKwon on 12/9/23.
//

import SwiftUI

let myPets = ["멍멍이 🐶", "고양이 😺", "찍찍이 🐭"]

struct ContentView: View {
    
    @State private var shouldShowAlert: Bool = false
    @State private var myText: String = ""
    @State private var selected: Int = 0
    var body: some View {
        NavigationView {
                VStack {
                    Spacer()
                    Text("\(myPets[selected])")
                        .font(.system(size: 60))
                        .bold()
                    Text("우측 상단에 땡땡땡을 눌러주세요!")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                .navigationTitle("하이요")
                .toolbar(content: {
                    ToolbarItem {
                        Menu {
                            Section {
                                // 버튼에 대한 처리가능
                                Button(action: {
                                    // 액션
                                    print("오늘도 빡코딩!")
                                    shouldShowAlert = true
                                    myText = "오늘도 빡코딩!"
                                }, label: {
                                    // 라벨
                                    Text("오늘도 빡코딩!")
                                })
                            }
                            
                            Section {
                                Button(action: {
                                    // 액션
                                    print("집에서 쉬는날")
                                    shouldShowAlert = true
                                    myText = "집에서 쉬는날"
                                }, label: {
                                    // 라벨
                                    Text("집에서 쉬는날")
                                })
                            }
                            
                            Picker(selection: $selected, label:Text("애완동물 선택")) {
                                ForEach(myPets.indices, id: \.self) { index in
                                    Text("\(myPets[index])")
                                }
                            }
                        } label: {
                            Circle().foregroundColor(.purple)
                                .frame(width: 50, height: 50)
                                .overlay (
                                Label("더보기", systemImage: "ellipsis")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                )
                        } // 메뉴
                    }
                })
                .alert(isPresented: $shouldShowAlert, content: {
                    Alert(title: Text("알림"), message: Text("\(myText)"), dismissButton: .default(Text("확인")))
                })
        }
    }
}

#Preview {
    ContentView()
}
