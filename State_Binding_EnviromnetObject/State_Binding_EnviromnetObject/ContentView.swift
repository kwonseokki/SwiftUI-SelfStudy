//
//  ContentView.swift
//  State_Binding_EnviromnetObject
//
//  Created by SeokkiKwon on 12/10/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: MyViewModel
    
    @State var count = 0
    @State var appTitle: String = ""
//    var appTitle: String
    
//    init(count: Int = 0, appTitle: String = "빡코딩의 일상") {
//        self.appTitle = appTitle
//    }
    
    var body: some View {
            TabView {
                VStack {
                    Text("오늘도 빡코딩 count: \(count)")
                        .padding()
                    Button(action: {
                        count += 1
                        viewModel.appTitle = "빡코딩의 일상 \(count)일차"
                    }, label: {
                        Text("카운트 업")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                }
                .tabItem {
                    Label("오늘도", systemImage: "pencil")
                }
                
                BeforeBadView(count: $count)
                    .tabItem {
                        Label("자기전", systemImage: "folder")
                    }
                
                WeeklyView(count: $count)
                    .padding()
                    .tabItem {
                        Label("주말에도", systemImage: "pencil")
                    }
            }
            .onReceive(viewModel.$appTitle, perform: { recevedAppTitle in
                print("ContentView receivedAppTitle: \(recevedAppTitle)")
                self.appTitle = recevedAppTitle
            })
            .overlay(Text(appTitle).offset(y: -(UIScreen.main.bounds.height * 0.4)))
           
    }
}

//#Preview {
//    ContentView()
//}
