//
//  AniNavigationMenuView.swift
//  Animation
//
//  Created by SeokKi Kwon on 2023/12/20.
//

import SwiftUI

struct AniNavigationMenuView: View {
    var body: some View {
        NavigationMenu()
    }
}

// 중복된 코드 ForEach를 사용하여 단순화

struct NavigationMenu: View {
    
    // 메뉴 항목이 선택될 때마다 뷰 변경에 애니메이션을 적용하는 네임스페이스 변수
    @Namespace private var menuItemTransition
    @State private var selectedIndex = 0
    let menuItems = ["Travel", "Nature", "Architecture"]
    
    var body: some View {
        HStack {
            Spacer()
            ForEach(menuItems.indices, id: \.self) { index in
                if index == selectedIndex {
                    Text(menuItems[index])
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        .foregroundStyle(.white)
                        .background(Capsule().foregroundStyle(.purple))
                    // 메뉴 항목이 선택될 때마다 보기 변경에 애니메이션을 적용
                    // matchedGeometryEffect 동일한 뷰를 나타내는 애니메이션 효과를줌
                    // matchedGeometryEffect 수정자는 @Namespace 속성래퍼를 사용해야 한다
                        .matchedGeometryEffect(id: "menuItem", in: menuItemTransition)
                        
                } else {
                    Text(menuItems[index])
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        .background(Capsule().foregroundStyle(Color(uiColor: .systemGray5)))
                        .onTapGesture {
                            selectedIndex = index
                        }
                }
                
                Spacer()
            }
            
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        // 뷰 애니메이션을 활성화하려면 .animation 수정자를 추가
        .animation(.easeInOut, value: selectedIndex)
    }
}

#Preview {
    AniNavigationMenuView()
}
