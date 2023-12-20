//
//  AnimatedSymbolEffectView.swift
//  Animation
//
//  Created by SeokKi Kwon on 2023/12/20.
//

import SwiftUI

struct AnimatedSymbolEffectView: View {
    var body: some View {
        BounceAniSFView()
        MoreSymbolAnimationView()
        ContentTransitionAnimationView()
    }
}
// 심볼이펙트 애니메이션
// 버튼같은경우 탭 했을때 버튼이 작아졌다가 커지는 애니메이션이 시스템에서 제공
struct BounceAniSFView: View {
    
    @State private var animate = false
    
    var body: some View {
        Image(systemName: "ellipsis.message")
            .font(.system(size: 100))
            .symbolRenderingMode(.palette)
            .foregroundStyle(.purple, .gray)
            .symbolEffect(.bounce, options: .repeat(2).speed(1.5), value: animate)
            .onTapGesture {
                animate.toggle()
            }
        }
    }

// 컨텐츠전환 및 애니메이션 교체
struct ContentTransitionAnimationView: View {
    
    @State private var animate = false
    
    var body: some View {
        Image(systemName: animate ? "checkmark.circle" : "touchid")
            .font(.system(size: 100))
            .symbolRenderingMode(.palette)
            .foregroundStyle(.purple, .gray)
            .symbolEffect(.bounce, options: .repeat(2).speed(1.5), value: animate)
            .contentTransition(.symbolEffect(.replace))
            .onTapGesture {
                animate.toggle()
            }
    }
}

// SymbolEffect 수정자를 다양한 애니메이션과 결합
struct MoreSymbolAnimationView: View {
    
    @State private var animate = false
    
    var body: some View {
        Image(systemName: "ellipsis.message")
            .font(.system(size: 100))
            .symbolRenderingMode(.palette)
            .foregroundStyle(.purple, .gray)
            .symbolEffect(.bounce, options: .repeat(2).speed(1.5), value: animate)
            .symbolEffect(.pulse, options: .repeating , value: animate)
            .onTapGesture {
                animate.toggle()
            }
    }
}

#Preview {
    AnimatedSymbolEffectView()
}
