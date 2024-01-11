//
//  ContentView.swift
//  SwiftUI_Image
//
//  Created by SeokkiKwon on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                CircleImageView()
                HStack {
                    NavigationLink(destination: MyWebView(url: "https://www.naver.com")) {
                        Text("네이버로 이동하기")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(.red)
                            .cornerRadius(20)
                        
                    }
                    
                    NavigationLink(destination: MyWebView(url: "https://www.naver.com")) {
                        Text("오픈톡방")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(.yellow)
                            .cornerRadius(20)
                        
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
