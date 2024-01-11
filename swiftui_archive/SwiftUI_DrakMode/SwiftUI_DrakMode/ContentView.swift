//
//  ContentView.swift
//  SwiftUI_DrakMode
//
//  Created by SeokkiKwon on 12/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shouldShowAlert = false
    
    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            VStack {
                Button(action: {
                    print("버튼이 클릭 되었습니다.")
                    shouldShowAlert.toggle()
                }, label: {
                    Text("로그인 하러가기")
                        .myButtonStyle()
                })
            }
        }
    }
}

struct myRoundedButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .cornerRadius(13)
            .overlay (
                RoundedRectangle(cornerRadius: 13)
                    .stroke(.white, lineWidth: 3)
            )
    }
}

extension View {
    func myButtonStyle() -> some View {
       modifier(myRoundedButton())
    }
}

#Preview {
    ContentView()
}
