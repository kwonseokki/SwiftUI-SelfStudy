//
//  AniContentView.swift
//  Animation
//
//  Created by SeokKi Kwon on 2023/12/19.
//

import SwiftUI

struct AniContentView: View {
    @State private var rotation: Double = 0
    @State private var scale: CGFloat = 1
    var body: some View {
        ScrollView {
            ButtonImplicitAniView()
            ButtonExplicitAniView()
            CircleExplicitAniView()
            StateBindingAniView()
            AutoStartAniView()
            TransitionAniView()
        }
    }
}

struct TransitionAniView: View {
    @State private var isButtonVisible = true
    var body: some View {
        VStack {
            Toggle(isOn: $isButtonVisible.animation(.linear(duration: 1))) {
                Text("Show/Hide Button")
            }.padding()
            
            if isButtonVisible {
                Button {
                    
                } label: {
                    Text("Example Button")
                }
                .font(.largeTitle)
                .transition(.asymmetric(insertion: .scale, removal: .slide))
            }
        }
    }
}

extension AnyTransition {
    static var fadeAndMode: AnyTransition {
        AnyTransition.opacity.combined(with: .move(edge: .top)) // 투명도와 이동을 결합
    }
}

struct AutoStartAniView: View {
    @State private var rotation: Double = 0
    @State private var isSpining = false
    var body: some View {
        ZStack {
         Circle()
                .stroke(lineWidth: 2)
                .foregroundStyle(.blue)
                .frame(width: 360)
            
            Image(systemName: "forward.fill")
                .font(.largeTitle)
                .offset(y: -180)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 5).repeatForever(autoreverses: false), value: rotation)
        }
        .onAppear {
            self.isSpining.toggle()
            rotation = isSpining ? 360 : 0
        }
    }
}

struct StateBindingAniView: View {
    @State private var visibility = false
    var body: some View {
        VStack {
            Toggle(isOn: $visibility.animation(.linear(duration: 2)), label: {
                Text("Toggle Text Views")
            })
            .padding()
            
            if visibility {
                Text("Hello World")
                    .font(.largeTitle)
            }
            
            else {
                Text("Goodbye World")
                    .font(.largeTitle)
            }
        }
    }
}

// 암묵적 애니메이션
struct ButtonImplicitAniView: View {
    @State private var rotation: Double = 0
    @State private var scale: CGFloat = 1
    var body: some View {
        Button(action: {
            self.rotation = (self.rotation < 360 ? self.rotation + 60 : 0)
            self.scale = (self.scale < 2.8 ? self.scale + 0.3 : 1)
        }, label: {
            Text("Click to animate")
            // repeatCount() 수정자 : 지정된 횟수만큼 애니메이션을 반복
                .rotationEffect(.degrees(rotation))
//                .animation(.spring(response: 1, dampingFraction: 0.2, blendDuration: 0), value: rotation)
//                .animation(.easeInOut(duration: 1).repeatCount(2, autoreverses: true),  value: rotation)
                .animation(.linear(duration: 0.5).repeatForever(),  value: rotation)
                .scaleEffect(scale)
        })
    }
}

// 암시적 애니메이션
struct ButtonExplicitAniView: View {
    @State private var rotation: Double = 0
    @State private var scale: CGFloat = 1
    var body: some View {
        Button(action: {
            withAnimation(.linear(duration: 2)) {
                // 회전 애니메이션만 적용
                self.rotation = (self.rotation < 360 ? self.rotation + 60 : 0)
            }
            
            self.scale = (self.scale < 2.8 ? self.scale + 0.3 : 1)
        }, label: {
            Text("Click to animate")
            // repeatCount() 수정자 : 지정된 횟수만큼 애니메이션을 반복
                .rotationEffect(.degrees(rotation))
//                .animation(.spring(response: 1, dampingFraction: 0.2, blendDuration: 0), value: rotation)
//                .animation(.easeInOut(duration: 1).repeatCount(2, autoreverses: true),  value: rotation)
//                .animation(.linear(duration: 0.5).repeatForever(),  value: rotation)
                .scaleEffect(scale)
        })
    }
}

struct CircleExplicitAniView: View {
    @State private var yellowCircle = false
    var body: some View {
       Circle()
            .fill(yellowCircle ? .yellow : .blue)
            .frame(width: 100, height: 100)
            .onTapGesture {
                withAnimation {
                    yellowCircle.toggle()
                }
            }
    }
}


#Preview {
    AniContentView()
}
