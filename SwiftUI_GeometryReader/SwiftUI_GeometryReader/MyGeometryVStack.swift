//
//  MyGeometryVStack.swift
//  SwiftUI_GeometryReader
//
//  Created by SeokkiKwon on 12/6/23.
//

import SwiftUI

enum Index {
    case one, two, three
}

struct MyGeometryVStack: View {
    
    @State var index: Index = .one
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Button(action: {
                    withAnimation{index = .one}
                }, label: {
                    Text("1")
                        .frame(width:100, height: geometry.size.height / 3)
                        .padding(.horizontal, index == .one ? 50 : 0)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                })
                
                Button(action: {
                    withAnimation{index = .two}
                    
                }, label: {
                    Text("2")
                        .frame(width:100, height: geometry.size.height / 3)
                        .padding(.horizontal, index == .two ? 50 : 0)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                })
                
                Button(action: {
                    withAnimation{index = .three}
                }, label: {
                    Text("3")
                        .frame(width:100, height: geometry.size.height / 3)
                        .padding(.horizontal, index == .three ? 50 : 0)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                })
            }
            
            
        }.edgesIgnoringSafeArea(.all)
            .background(.yellow)
    }
}

#Preview {
    MyGeometryVStack()
}
