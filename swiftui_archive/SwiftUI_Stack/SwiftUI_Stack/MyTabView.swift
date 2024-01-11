//
//  MyTabView.swift
//  SwiftUI_Stack
//
//  Created by SeokkiKwon on 12/9/23.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            // 보여질 화면
            MyView(title: "1번", bgColor: .red)
                .tabItem {
                    Image(systemName: "airplane")
                    Text("1번")
                }
                .tag(0)
            
            MyView(title: "2번", bgColor: .yellow)
                .tabItem {
                    Image(systemName: "flame.fill")
                    Text("2번")
                }
                .tag(1)
            
            MyView(title: "3번", bgColor: .blue)
                .tabItem {
                    Image(systemName: "doc.fill")
                    Text("3번")
                }
                .tag(2)
        }
    }
}

#Preview {
    MyTabView()
}
