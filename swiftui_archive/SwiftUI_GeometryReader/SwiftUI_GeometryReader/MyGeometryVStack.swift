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
    
    // 지오메트리 프록시를 매개변수로 가지고 CGPoint를 반환하는 클로저
    let centerPosition: (GeometryProxy) -> CGPoint = { proxy in
        return CGPoint(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
    }
    
    var body: some View {
        GeometryReader { proxy in
            // GeometryReader는 부모뷰의 사이즈를 기반으로 유동적으로 사이즈 조절이 가능함
            VStack(spacing: 0) {
                Button(action: {
                    withAnimation{index = .one}
                }, label: {
                    Text("1")
                        .frame(width:100, height: proxy.size.height / 3)
                        .padding(.horizontal, index == .one ? 50 : 0)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                })
                
                Button(action: {
                    withAnimation{index = .two}
                    
                }, label: {
                    Text("2")
                        .frame(width:100, height: proxy.size.height / 3)
                        .padding(.horizontal, index == .two ? 50 : 0)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                })
                
                Button(action: {
                    withAnimation{index = .three}
                }, label: {
                    Text("3")
                        .frame(width:100, height: proxy.size.height / 3)
                        .padding(.horizontal, index == .three ? 50 : 0)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                })
            }
            //            .position(CGPoint(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY))
            .position(centerPosition(proxy))
            // position을 정한다
            // CGPoint로 proxy의 x, y 축의 중앙으로 설정해준다. proxy는 VStack의 크기를 말함
            
            
        }.edgesIgnoringSafeArea(.all)
            .background(.yellow)
    }
}

#Preview {
    MyGeometryVStack()
}
