//
//  MyCard.swift
//  SwiftUI_Stack
//
//  Created by SeokkiKwon on 12/6/23.
//

import SwiftUI

struct MyCard: View {
    var icon: String
    var title: String
    var start: String
    var end: String
    var bgColor: Color
    var body: some View {
        HStack(spacing: 20) {
                Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(Color.white)
                
                VStack(alignment: .leading, spacing: 0) {
                    Divider().opacity(0)
                    Text(title)
                        .fontWeight(.bold)
                        .font(.system(size: 23))
                        .foregroundColor(Color.white)
                    Spacer().frame(height: 5)
                    Text("\(start) - \(end)")
                        .foregroundColor(Color.white)
                }
            }
        .padding()
        .background(bgColor)
        .cornerRadius(20)
    }
}

#Preview {
    MyCard(icon: "doc.fill", title: "책읽기", start: "1 PM", end: "3 PM", bgColor: .purple)
}
