//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by SeokKi Kwon on 2024/01/27.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        // 수정자의 순서
        // 뷰에 속성 설정이 아닌 속성이 적용된 새로운 구조체를 생성
        Button("Hello, world!") {
            print(type(of: self.body))
        }
        .frame(width: 200, height: 200)
        .background(.red)
        
        // if보다 삼항연산자가 성능이 좋음
        // if의 경우 조건이 반대가 되는경우 View를 파괴하고 다시 생성
        Button("Hello World") {
            useRedText.toggle()
        }
        .foregroundStyle(useRedText ? .red : .blue)
        
        // 환경수정자
        // 동일한 효과의 경우 VStack에 주는게 효과적
        VStack {
            Text("Gryffindor")
                .blur(radius: 0)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .blur(radius: 5)
        
        // View 분리하기
        VStack {
            CapsuleText(text: "First")
                .foregroundStyle(.white)
            CapsuleText(text: "Second")
                .foregroundStyle(.yellow)
        }
        
        // ViewModifer
        Text("Hello World")
            .modifier(Title())
        
        // extension + ViewModifier
        Text("Hello World")
            .titleStyle()
        
        // extension + ViewModifier
        Color.blue
            .frame(width: 300, height: 200)
            .waterMarked(with: "Hacking with Swift")
    }
}

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func waterMarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}


#Preview {
    ContentView()
}
