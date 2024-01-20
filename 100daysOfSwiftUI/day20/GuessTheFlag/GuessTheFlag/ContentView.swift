//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by SeokKi Kwon on 2024/01/20.
//

import SwiftUI

struct ContentView: View {
    // 경고가 표시되는지 여부를 추적하는 상태
    @State private var showingAlert = false
    var body: some View {
        VStack {
            // ZStack 크기 변경
           
            
            // 선현 그라디언트
//            LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
            
            // 그라디언트 범위 지정
//            LinearGradient(stops:[
//                // .init 으로도 가능
//                .init(color: .white, location: 0.45),
//                Gradient.Stop(color: .black, location: 0.55)
//            ], startPoint: .top, endPoint: .bottom)
            
            // 방사형 그라디언트
//            RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
            
//            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
            
            // role: 버튼의 역할을 나타냄
            Button("Delete selection", role: .destructive, action: executeDelete)
            
            Button("Button 1") {}
                .buttonStyle(.bordered)
            
            Button("Button 1", role: .destructive) {}
                .buttonStyle(.bordered)
            
            Button("Button 1") {}
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            
            Button("Button 1", role: .destructive) {}
                .buttonStyle(.borderedProminent)
            
            // 커스텀 스타일을 원하는 경우 후행 클로저를 사용하영 레이블 전달
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
            
            Button {
                print("Edit button was tapped")
            } label: {
                Image(systemName: "pencil")
            }
            
            Button("Edit", systemImage: "pencil") {
                print("Edit button was tapped")
            }
            
            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
            
            // 데이터가 바인딩 되어 OK를 누르면 false로 바뀜
            Button("Show Alert") {
                showingAlert = true
            }
            .alert("Important message", isPresented: $showingAlert) {
//                Button("Delete", role: .destructive) {}
                Button("Cancle", role: .cancel) {}
            } message: {
                Text("Plases read this.")
            }
            
            Text(showingAlert.description)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func executeDelete() {
        print("Now deleting…")
    }
}

#Preview {
    ContentView()
}
