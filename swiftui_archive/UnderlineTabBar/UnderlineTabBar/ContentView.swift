//
//  ContentView.swift
//  UnderlineTabBar
//
//  Created by 권석기 on 9/25/24.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Int = 0
    var body: some View {
        ZStack(alignment: .top) {
            TabView(selection: self.$currentTab) {
                View1().tag(0)
                View2().tag(1)
                View3().tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)
            
            TabBarView(currentTab: self.$currentTab)
        }
    }
}

struct TabBarView: View {
    @Namespace var namespace
    @Binding var currentTab: Int
    var tabBarOptions: [String] = ["Hello World", "This is", "Something cool that I'm doing"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(Array(zip(self.tabBarOptions.indices, self.tabBarOptions)),
                        id: \.0) { index, name in
                    TabBarItem(currentTab: self.$currentTab, namespace: self.namespace,
                               tabBarItemName:name ,
                               tab: index)
                }
            }
        }
        .background(Color.white)
        .frame(height: 80)
        .edgesIgnoringSafeArea(.all)
    }
}

struct TabBarItem: View {
    @Binding var currentTab: Int
    let namespace: Namespace.ID
    
    var tabBarItemName: String
    var tab: Int
    
    var body: some View {
        Button(action: {
            self.currentTab = tab
        }, label: {
            VStack {
                Spacer()
                Text(tabBarItemName)
                if currentTab == tab {
                    Color.black
                        .frame(height: 2)
                        .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
                } else {
                    Color.clear.frame(height: 2)
                }
            }
            .animation(.spring, value: currentTab)
        })
        .buttonStyle(.plain)
    }
}

#Preview {
    ContentView()
}
