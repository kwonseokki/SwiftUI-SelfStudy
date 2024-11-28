//
//  ContentView.swift
//  Transaction
//
//  Created by 권석기 on 11/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var scale = false
    var body: some View {
        // SwiftUI는 모든 상태변경에 대한 트랜잭션을 만듬
//        AnimatedView(scale: scale ? 0.5 : 1)
//            .onTapGesture {
//                var transaction = Transaction(animation: .linear) // 새로운 트랜잭션 생성
//                transaction.disablesAnimations = true // 해당뷰의 애니메이션 활성여부
//                
//                // 새로운 트랜잭션으로 scale 적용
//                // 자식뷰의 spring 애니메이션을 lenear로 변경
//                withTransaction(transaction) {
//                    scale.toggle()
//                }
//            }
        // transaction 수정자로 해당뷰의 inout 인스턴스를 받아서 수정
        VStack {
            AnimatedView(scale: scale ? 0.5 : 1)
                .transaction { transaction in
                    transaction.animation = .spring
                }
            AnimatedView(scale: scale ? 0.5 : 1)
                .transaction { transaction in
                    transaction.disablesAnimations = true
                }
        }
        .onTapGesture {
            scale.toggle()
        }
    }
}

struct AnimatedView: View {
    let scale: CGFloat
    
    var body: some View {
        Circle()
            .fill(Color.accentColor)
            .scaleEffect(scale)
            .animation(.spring())
    }
}

#Preview {
    ContentView()
}
