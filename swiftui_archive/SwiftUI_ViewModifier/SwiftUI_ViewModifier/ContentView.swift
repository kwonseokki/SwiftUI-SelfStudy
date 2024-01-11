//
//  ContentView.swift
//  SwiftUI_ViewModifier
//
//  Created by SeokkiKwon on 12/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 50) {
            
            Text("Hello, world!")
                .modifier(MyRoundedText())
            
            Text("Hello, world!")
                .myRoundedTextStyle()
            
            Image(systemName: "pencil")
                .myRoundedTextStyle()
            
            Rectangle().frame(width: 100, height: 100)
                .myRoundedTextStyle()
        }
        .padding()
    }
}

extension View {
    func myRoundedTextStyle() -> some View {
        modifier(MyRoundedText())
    }
}

// 뷰를 꾸며주는 모디파이어
struct MyRoundedText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding()
            .background(Color.yellow)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.blue)
            )
    }
}

#Preview {
    ContentView()
}
