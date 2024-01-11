//
//  MyView.swift
//  SwiftUI_Stack
//
//  Created by SeokkiKwon on 12/9/23.
//

import SwiftUI

struct MyView: View {
    var title: String
    var bgColor: Color
    
    var body: some View {
        ZStack {
            bgColor
                .edgesIgnoringSafeArea(.all)
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    MyView(title: "", bgColor: .red)
}
