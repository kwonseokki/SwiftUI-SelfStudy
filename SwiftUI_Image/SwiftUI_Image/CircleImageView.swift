//
//  CircleImageView.swift
//  SwiftUI_Image
//
//  Created by SeokkiKwon on 12/5/23.
//

import SwiftUI

struct CircleImageView: View {
    var body: some View {
//        Image(systemName: "flame.fill")
//            .font(.system(size: 200))
//            .foregroundColor(.yellow)
//            .shadow(color: .gray, radius: 2, x: 5, y:10)
        // Aspect Fit Aspect Fill
        // fill 원본배열 유지하면서 이미지를 확대
        // fit 이미지 비율을 유지하면서 크기를 맞춤
        Image("myImage")
            .resizable() // resizle로 딱맞게 설정
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .clipped().clipShape(Circle())
            .overlay(
                Circle().foregroundColor(.black)
                    .opacity(0.4)
            )
            .overlay(
                Circle().stroke(Color.red, lineWidth: 10)
                    .padding()
                    .overlay(
                        Circle().stroke(Color.yellow, lineWidth: 10)
                            .padding(30)
                        )
                    .overlay(
                        Circle().stroke(Color.blue, lineWidth: 10)
                          
                        )
                    .overlay(
                        Text("호호")
                            .foregroundColor(.white)
                            .font(.system(size:30))
                            .fontWeight(.bold)
                        
                    )
            )
        // .overlay 뷰를 덮어쓰기
        // cliped 이미지를 frame만큼의 크기로 자른다
        

    }
}

#Preview {
    CircleImageView()
}
