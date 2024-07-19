//
//  ContentView.swift
//  Rating
//
//  Created by 석기권 on 7/20/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rating = 0
    
    var body: some View {
        ZStack {
            starView
                .overlay (
                    GeometryReader { geo in
                        ZStack {
                            Rectangle()
                                .fill(Color.yellow)
                                .frame(width: CGFloat(rating) / 5 * geo.size.width)
                        }
                        .allowsHitTesting(false)
                    }
                )
            // 현재 뷰의 다른 뷰의 알파값을 적용
            // 현재의 View에 starView 마스크 추가
            // starView의 불투명한 부분인 별모양만 나타나고 투명한 배경은 가려짐
                .mask(starView)
                
        }
    }
    
    private var starView: some View {
        HStack {
            ForEach(1..<6) { star in
                Image(systemName: "star.fill")
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            rating = star
                        }
                    }
            }
        }
    }
}



#Preview {
    ContentView()
}
