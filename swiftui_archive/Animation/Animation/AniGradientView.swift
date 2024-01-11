//
//  AniGradientView.swift
//  Animation
//
//  Created by SeokKi Kwon on 2023/12/20.
//

import SwiftUI

struct AniGradientView: View {
    var body: some View {
//        StartEndAniGradientView()
//        RadialAniGradientView()
        AnimatableGradientView()
//        HueRotationAniGradientView()
    }
}

struct AnimatableGradientView: View {
    
    // 애니메이션 상태를 유지하는 상태 변수를 선언
    @State private var progress: CGFloat = 0
    let gradient1 = Gradient(colors: [.purple, .yellow])
    let gradient2 = Gradient(colors: [.blue, .purple])
    
    var body: some View {
        Rectangle()
            .animatableGradient(fromGradient: gradient1, toGradient: gradient2, progress: progress)
            .ignoresSafeArea()
        
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
                    self.progress = 3
                }
            }
    }
}
/**
 AnimatableModifier를 이용하여 extenstion 만들기
 */
struct AnimatableGradientModifier: AnimatableModifier {
    let fromGradient : Gradient
    let toGradient: Gradient
    var progress: CGFloat
    
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
    
    func body(content: Content) -> some View {
        var gradientColors = [Color]()

               for i in 0..<fromGradient.stops.count {
                   let fromColor = UIColor(fromGradient.stops[i].color)
                   let toColor = UIColor(toGradient.stops[i].color)

                   gradientColors.append(
                       colorMixer(fromColor: fromColor, toColor: toColor, progress: progress)
                   )
               }

               return LinearGradient(gradient: Gradient(colors: gradientColors),
                                     startPoint: .topLeading,
                                     endPoint: .bottomTrailing)
    }
    
    // 색상을 섞어주는 함수
    func colorMixer(fromColor: UIColor, toColor: UIColor, progress: CGFloat) -> Color {
            guard let fromColor = fromColor.cgColor.components else { return Color(fromColor) }
            guard let toColor = toColor.cgColor.components else { return Color(toColor) }

            let red = fromColor[0] + (toColor[0] - fromColor[0]) * progress
            let green = fromColor[1] + (toColor[1] - fromColor[1]) * progress
            let blue = fromColor[2] + (toColor[2] - fromColor[2]) * progress

            return Color(red: Double(red), green: Double(green), blue: Double(blue))
        }
}
// extension에 추가
extension View {
    func animatableGradient(fromGradient: Gradient, toGradient: Gradient, progress: CGFloat) -> some View {
        self.modifier(AnimatableGradientModifier(fromGradient: fromGradient, toGradient: toGradient, progress: progress))
    }
}

/**
뷰에 색조 회전 효과를 적용
 */
struct HueRotationAniGradientView: View {
    
    // 애니메이션 상태를 유지하는 상태 변수를 선언
    @State private var animateGradient = false
    
    var body: some View {
        LinearGradient(colors: [.purple, .yellow], startPoint: animateGradient ? .topLeading : .bottomLeading, endPoint: animateGradient ? .bottomTrailing : .topTrailing)
            .ignoresSafeArea()
            .hueRotation(.degrees(animateGradient ? 90 : 0))
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
                    self.animateGradient.toggle()
                }
            }
    }
}

/**
방사형 그라디언트 애니메이션
 */
struct RadialAniGradientView: View {
    
    // 애니메이션 상태를 유지하는 상태 변수를 선언
    @State private var animateGradient = false
    
    var body: some View {
        // 방사형 그라디언트
        RadialGradient(colors: [.purple, .yellow], center: .center, startRadius: animateGradient ? 400 : 200, endRadius: animateGradient ? 20 : 40)
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
                    self.animateGradient.toggle()
                }
            }
    }
}

/**
선형적 그라디언트 애니메이션
 */
struct StartEndAniGradientView: View {
    
    // 애니메이션 상태를 유지하는 상태 변수를 선언
    @State private var animateGradient = false
    
    var body: some View {
        LinearGradient(colors: [.purple, .yellow], startPoint: animateGradient ? .topLeading : .bottomLeading, endPoint: animateGradient ? .bottomTrailing : .topTrailing)
            .ignoresSafeArea()
        // 뷰가 나타나면 애니메이션이 바로 동작하도록 설정
            .onAppear {
                withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
                    self.animateGradient.toggle()
                }
            }
    }
}

#Preview {
    AniGradientView()
}
