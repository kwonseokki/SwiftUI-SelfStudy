//
//  MyUILabel.swift
//  SwiftUI_UIViewRepresentable
//
//  Created by SeokKi Kwon on 2023/12/16.
//

import SwiftUI

struct MyUILabel: UIViewRepresentable {
    var text: String
    func makeUIView(context: Context) -> some UIView {
        let myLabel = UILabel()
        myLabel.text = text
        return myLabel
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // 필요한 업데이트 작업을 수행
    }
}

#Preview {
    MyUILabel(text: "Hello world!")
}
