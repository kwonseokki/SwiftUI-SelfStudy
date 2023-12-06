//
//  MyList.swift
//  SwiftUI_Stack
//
//  Created by SeokkiKwon on 12/6/23.
//

import SwiftUI

struct MyList: View {
    
    @Binding var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)) {
        // #available 여러 플랫폼에서 다른 논리를 처리하기 위함
        // 현재 플랫폼이 iOS 14.0 이상의 버전인지 확인
        if #available(iOS 14.0, *) {
        } else {
            UITableView.appearance().tableFooterView = UIView()
        }
        UITableView.appearance().separatorStyle = .none
    
        _isNavigationBarHidden = isNavigationBarHidden
    }
    var body: some View {
        List {
            Section(header: Text("오늘 할 일").font(.headline).foregroundColor(.black), footer: Text("footer")){
                ForEach(1...3, id:\.self) { itemIndex in
                    MyCard(icon: "book.fill", title: "책읽기", start: "10 AM", end: "10 PM", bgColor: .purple)
                }
            }
            
            Section(header: Text("내일 할 일")){
                ForEach(1...20, id:\.self) { itemIndex in
                    MyCard(icon: "book.fill", title: "책읽기", start: "10 AM", end: "10 PM", bgColor: .blue)
                }
            }.listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
        .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("내 목록"))
            .navigationBarTitle(Text("메인"))
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
        
    }
}

#Preview {
    MyList()
}

