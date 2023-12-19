//
//  ContentView.swift
//  GraphicDrawing
//
//  Created by SeokKi Kwon on 2023/12/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                // 파이차트 그리기 예제
                ZStack {
                    pieChart(startAngle: 190, endAngle: 0)
                        .fill(.yellow)
                        .frame(width:300, height: 300)
                    
                    pieChart(startAngle: 110, endAngle: 190)
                        .fill(.cyan)
                        .frame(width:300, height: 300)
                    
                    pieChart(startAngle: 90, endAngle: 110)
                        .fill(.blue)
                        .frame(width:300, height: 300)
                    
                    pieChart(startAngle: 0, endAngle: 90)
                        .fill(.purple)
                        .frame(width:300, height: 300)
                        .offset(x:20, y:20)
                        .overlay(
                            pieChart(startAngle: 0, endAngle: 90)
                                .stroke(style: StrokeStyle(lineWidth: 10))
                                .frame(width:290, height: 290)
                                .offset(x:20, y:20)
                        )
                        .overlay (
                            Text("25%")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .offset(x: 80, y: 80)
                        )
                }
                .padding(20)
//                MyShape()
//                    .frame(height: 300)
                CarView()
            }
        }
        .padding()
    }
}

/**
 Shape 구조체 만들기
 path 메서드 필수로 구현 in rect: CGRect로 도형 프레임 정보를 받아올 수 있음.
 
 func addArc(
 withCenter center: CGPoint, -> 원의 중심정
 radius: CGFloat, -> 원의 반지름
 startAngle: CGFloat, -> 호의 시작 각도
 endAngle: CGFloat, -> 호의 끝 각도를 지정
 clockwise: Bool. -> 호를 그리는 방향
 
 SwiftUI에서 반시계방향으로 각도를 정의하면 우리가 생각하는 시계방향으로 설정됨
 )
 */

struct pieChart: Shape {
    var startAngle: Double
    var endAngle: Double
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.midX, startAngle: Angle(degrees: startAngle), endAngle: Angle(degrees: endAngle), clockwise: false)
        path.closeSubpath()
        return path
    }
}

struct CarShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 20, y: 60)) // 20, 60 에서 시작
        path.addLine(to: CGPoint(x: 40, y: 60))
        path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y:0)) // y를 0으로 설정하면 프레임의 맨위에 밀착됨
        path.addLine(to: CGPoint(x: 230, y: 60))
        path.addLine(to: CGPoint(x: 230, y: 100))
        path.addLine(to: CGPoint(x: 20, y: 100))
        path.closeSubpath()
        return path
    }
}

struct CarView: View {
    var body: some View {
        VStack {
            CarShape()
                .fill(.purple)
                .overlay(
                    CarShape()
                        .stroke(lineWidth: 7).foregroundStyle(.black)
                )
        }
    }
}

struct GradientView: View {
    let colors = Gradient(colors: [.red, .yellow, .green, .purple])
    var body: some View {
        VStack {
            Text("그레이디언트")
            Circle()
                .fill(.blue.gradient)
                .frame(width: 200, height: 200)
            
            Text("드롭 새도")
            Circle()
                .fill(.blue.shadow(.inner(color: .black, radius: 1)))
                .frame(width: 200, height: 200)
            
            Text("이너 새도")
            Circle()
                .fill(.blue.shadow(.inner(color: .black, radius: 1)))
                .frame(width: 200, height: 200)
            
            Text("방사형 그레이디언트")
            Circle()
                .fill(RadialGradient(gradient: colors, center: .center, startRadius: CGFloat(0), endRadius: CGFloat(300)))
                .frame(width: 200, height: 200)
            
            Text("원뿔형 그레이디언트")
            Circle()
                .fill(AngularGradient(gradient: colors, center: .center))
                .frame(width: 200, height: 200)
            
            Text("선형 그레이디언트")
            Circle()
                .fill(LinearGradient(gradient: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 200, height: 200)
            
            Text("fill, background 그레이디언트")
            MyShape()
                .fill(RadialGradient(gradient: colors, center: .center, startRadius: CGFloat(0), endRadius: CGFloat(300)))
                .background(LinearGradient(gradient: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 360, height: 360)
        }
    }
}


struct PathView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 10, y: 10))
            path.addLine(to: CGPoint(x: 10, y: 350))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.closeSubpath()
        }
        .fill(.green)
    }
}

struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        return path
    }
}

struct ShapeView: View {
    var body: some View {
        VStack {
            Text("기본 도형")
            Rectangle()
            
            Circle()
                .fill(.orange)
                .frame(width: 200, height: 200)
            
            Capsule()
                .stroke(lineWidth:10)
                .foregroundStyle(.blue)
                .frame(width: 200, height: 100)
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 8, dash: [CGFloat(10), CGFloat(20)]))
            
            Ellipse()
                .stroke(style: StrokeStyle(lineWidth: 20, dash: [CGFloat(10), CGFloat(5), CGFloat(2)], dashPhase: CGFloat(10)))
                .foregroundStyle(.blue)
                .frame(width: 250, height: 150)
            
            Text("테두리 오버레이 사용")
            Ellipse()
                .fill(.red)
                .overlay(Ellipse().stroke(.blue, lineWidth: 10).foregroundStyle(.blue))
                .frame(width: 250, height: 150)
        }
        .padding()
    }
}



#Preview {
    ContentView()
}
