//
//  MyBasicCard.swift
//  SwiftUI_Stack
//
//  Created by SeokkiKwon on 12/6/23.
//

import SwiftUI

struct MyBasicCard: View {
    var body: some View {
        HStack(spacing: 20) {
                Image(systemName: "flame.fill")
                .font(.system(size: 40))
                .foregroundColor(Color.white)
                
                VStack(alignment: .leading, spacing: 0) {
                    Divider().opacity(0)
                    Text("하하하")
                        .fontWeight(.bold)
                        .font(.system(size: 23))
                        .foregroundColor(Color.white)
                    Spacer().frame(height: 5)
                    Text("하하하")
                        .foregroundColor(Color.white)
                }
            }
        .padding()
        .background(.purple)
        .cornerRadius(20)
    }
}

#Preview {
    MyBasicCard()
}
