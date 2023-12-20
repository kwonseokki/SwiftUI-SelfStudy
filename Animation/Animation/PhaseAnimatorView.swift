//
//  PhaseAnimatorView.swift
//  Animation
//
//  Created by SeokKi Kwon on 2023/12/20.
//

import SwiftUI

struct PhaseAnimatorView: View {
    @State private var startAnimation = false
    var body: some View {
        //        SimplePhaseAnimatorView()
        MultiPhaseAnimatorView()
    }
}

// 애니메이션의 단계를 정의
// 각 단계에서 이모티콘 아이콘의 크기 조정, 회전, 이동
enum Phase: CaseIterable {
    case initial
    case rotate
    case jump
    case fall
    
    var scale: Double {
        switch self {
        case .initial: 1.0
        case .rotate: 1.5
        case .jump: 0.8
        case .fall: 0.5
        }
    }
    
    var angle: Angle {
        switch self {
        case .initial, .jump: Angle(degrees: 0)
        case .rotate: Angle(degrees: 720)
        case .fall: Angle(degrees: 360)
        }
    }
    
    var offset: CGFloat {
        switch self {
        case .initial, .rotate: 0
        case .jump: -250
        case .fall: 450
        }
    }
}

struct SimplePhaseAnimatorView: View {
    @State private var startAnimation = false
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 200)
            .phaseAnimator([false, true], trigger: startAnimation) { content, phase in
                content
                    .scaleEffect(phase ? 1.0 : 0.7)
                    .foregroundStyle(phase ? .indigo : .blue)
                    .rotation3DEffect(
                        phase ? .degrees(720) : .zero,
                        axis: (x: 0, y: 1, z: 0)
                    )
            } animation: { Phase in
                switch Phase {
                case true: .smooth.speed(0.1)
                case false: .spring.speed(0.5)
                }
            }
            .onTapGesture {
                startAnimation.toggle()
            }
    }
}

struct MultiPhaseAnimatorView: View {
    @State private var startAnimation = false
    var body: some View {
        Text("😻")
            .font(.system(size: 100))
            .phaseAnimator(Phase.allCases, trigger: startAnimation) { content, phase in
                content
                    .scaleEffect(phase.scale)
                    .rotationEffect(phase.angle)
                    .offset(y:phase.offset)
            } animation: { Phase in
                switch Phase {
                case .initial: .bouncy
                case .rotate: .smooth
                case .jump: .spring
                case .fall: .smooth
                }
            }
            .onTapGesture {
                startAnimation.toggle()
            }
    }
}

#Preview {
    PhaseAnimatorView()
}
