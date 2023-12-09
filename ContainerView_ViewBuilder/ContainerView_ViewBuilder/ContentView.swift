//
//  ContentView.swift
//  ContainerView_ViewBuilder
//
//  Created by SeokkiKwon on 12/10/23.
//

import SwiftUI

// View프로토콜을 준수한다 제네릭으로 Content는 View를 받는다
struct HeaderContainer<Content: View> : View {
    let content: Content // 제네릭으로 받은 View
    let headerTitle: String
    let bgColor: Color
    init(
        headerTitle: String,
        bgColor: Color = .gray,
        @ViewBuilder content : () -> Content) {
            // content는 Content(View)를 리턴하는 클로저
        self.content = content()
        self.headerTitle = headerTitle
        self.bgColor = bgColor
    }
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.gray.opacity(0.8))
                .frame(height: 120)
                .background(bgColor)
                .overlay (
                Text(headerTitle)
                )
            self.content
        }
        .padding()
    }
}

struct ContentView: View {
    var body: some View {
        HeaderContainer(headerTitle: "헤더입니다", bgColor: .red) {
            Text("텍스트")
        }
    }
}

#Preview {
    ContentView()
}
