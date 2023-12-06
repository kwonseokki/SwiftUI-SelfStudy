//
//  MyNavigationView.swift
//  SwiftUI_Stack
//
//  Created by SeokkiKwon on 12/6/23.
//

import SwiftUI

struct MyNavigationView: View {
    var body: some View {
        NavigationView {
            MyList()
            
//                .navigationBarTitle("안녕하세요!") 기본은 largeTitle
                .navigationBarTitle("안녕하세요!", displayMode: .automatic)
                .navigationBarItems(
                    leading: Button(action: {
                        print("호호")
                    }, label: {
                    Text("호호")
                    }), trailing:
                        NavigationLink(destination: Text("넘어온 화면 입니다"), label: {
                            Image(systemName: "bookmark.fill")
                        })
                )
            
        }
    }
}

#Preview {
    MyNavigationView()
}
