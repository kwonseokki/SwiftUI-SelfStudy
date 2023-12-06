//
//  GeometryReader.swift
//  SwiftUI_GeometryReader
//
//  Created by SeokkiKwon on 12/6/23.
//

import SwiftUI

struct MyGeometryReader: View {
    var body: some View {
        GeometryReader { geometry in
            // 기본 spacing을 제거하기 위함
            VStack(spacing: 0) {
                Text("1")
                    .frame(height: geometry.size.height / 3)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
                Text("2")
                    .frame(height: geometry.size.height / 3)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
                Text("3")
                    .frame(height: geometry.size.height / 3)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
//                Text("4")
//                    .frame(width: 100)
//                    .background(Color.purple)
//                    .foregroundColor(.white)
//                    .font(.system(size: 24, weight: .bold))
            }
        }.background(Color.yellow)

    }
}

#Preview {
    MyGeometryReader()
}
