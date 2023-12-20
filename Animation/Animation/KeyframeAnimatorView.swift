//
//  KeyframeAnimatorView.swift
//  Animation
//
//  Created by SeokKi Kwon on 2023/12/20.
//

import SwiftUI

struct KeyframeAnimatorView: View {
    var body: some View {
        EmojiKeyframeAnimatorView()
    }
}

// 애니메이션 값 정의
struct AnimationValues {
    var scale = 1.0
    var verticalStretch = 1.0
    var translation = CGSize.zero
    var opacity = 1.0
}

// KeyframeAnimator
struct EmojiKeyframeAnimatorView: View {
    @State private var staredAnimation = false
    var body: some View {
        Text("😻")
            .font(.system(size: 100))
            .keyframeAnimator(initialValue: AnimationValues(), trigger: staredAnimation) { content, value in
                content
                    .scaleEffect(value.scale)
                    .scaleEffect(y: value.verticalStretch)
                    .offset(value.translation)
                    .opacity(value.opacity)
            } keyframes: { Value in
              
                KeyframeTrack(\.scale) {
                    
                    CubicKeyframe(0.8, duration: 0.2)
                    // 시간이 지남에 따라 다른 값 변경을 자유롭게 정의
                    // 애니메이션이 더 부드럽고 유동적으로 변한 것을 확인
                    CubicKeyframe(0.6, duration: 0.3)
                    CubicKeyframe(1.0, duration: 0.4)
                    
                    CubicKeyframe(0.8, duration: 0.2)
                    CubicKeyframe(0.6, duration: 0.3)
                    CubicKeyframe(1.0, duration: 0.4)
                }
                
                KeyframeTrack(\.verticalStretch) {
                    CubicKeyframe(0.8, duration: 0.2)
                }
                
                KeyframeTrack(\.translation) {
                    CubicKeyframe(CGSize(width: 100, height: 100), duration: 0.2)
                }
                
                KeyframeTrack(\.opacity) {
                    CubicKeyframe(0.1, duration: 0.2)
                }
            }
            .onTapGesture {
                self.staredAnimation.toggle()
            }

    }
}

#Preview {
    KeyframeAnimatorView()
}
