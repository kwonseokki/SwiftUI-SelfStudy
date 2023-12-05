//
//  MyWebView.swift
//  SwiftUI_Image
//
//  Created by SeokkiKwon on 12/5/23.
//

import SwiftUI
import WebKit
struct MyWebView: UIViewRepresentable {
    
    var url: String
    
    // ui뷰 만들기
    func makeUIView(context: Context) -> WKWebView {
        
        // url unwrapping
        guard let url = URL(string: self.url) else {
            // url 이 없으면 기본 웹페이지 보여주기
            return WKWebView()
        }
    
        // 위에서 받은 url 로 url 리퀘스트 인스턴스 생성
        let urlRequest = URLRequest(url: url)
        let wkWebview = WKWebView()
        wkWebview.load(urlRequest)
        return wkWebview
    }
    
    
    // 업데이트
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebView>) {
        
    }
}

//#Preview {
//    MyWebView()
//}
