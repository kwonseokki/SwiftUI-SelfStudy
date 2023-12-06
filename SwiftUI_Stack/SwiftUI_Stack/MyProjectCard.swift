//
//  MyProjectCard.swift
//  SwiftUI_Stack
//
//  Created by SeokkiKwon on 12/5/23.
//

import SwiftUI

struct MyProjectCard: View {
    // class는 참조형 struct는 값타입
    // @State를 이용하여 구조체 내에서 상태값을 사용가능
    @State var shouldShowAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Rectangle().frame(height: 0)
            Text("정대리 유튜브 프로젝트")
                .font(.system(size: 23))
                .fontWeight(.bold)
                .padding(.bottom, 5)
            Text("10 AM - 11 AM")
                .foregroundColor(.secondary)
                .padding(.bottom, 10)
            HStack {
                Image("1")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay (
                        Circle().stroke(lineWidth: 5)
                            .foregroundColor(Color.orange)
                    )
                Image("2")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Image("3")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Spacer()
                
                Button(action: {
                    self.shouldShowAlert = true
                }, label: {
                    Text("확인")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 80)
                        .background(.blue)
                        .cornerRadius(20)
                })
                .alert(isPresented: $shouldShowAlert) {
                    Alert(title: Text("알림창 입니다."))
                }
            }
        }
        .padding()
        .background(.yellow)
        .cornerRadius(20)
    }
}

#Preview {
    MyProjectCard()
}
