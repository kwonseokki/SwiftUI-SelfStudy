//
//  ContentView.swift
//  SwiftUI_Stack
//
//  Created by SeokkiKwon on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    @State var isNavigationBarHidden = false
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading) {
                    
                    HStack {
                        NavigationLink(destination: MyList(isNavigationBarHidden: $isNavigationBarHidden)) {
                            Image(systemName: "line.horizontal.3")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                        }
                       
                        Spacer()
                        Image(systemName: "person.crop.circle.fill")
                            .font(.largeTitle)
                    }
                    
                    Text("정대리 할 일목록")
                        .font(.system(size: 40))
                        .fontWeight(.black)
                        .padding(.top)
                    
                    ScrollView {
                        VStack(spacing: 10) {
                            MyProjectCard()
                            MyCard(icon: "tray.fill", title: "책상 정리하기", start: "10 AM", end: "11 AM", bgColor: .blue)
                            MyCard(icon: "tray.fill", title: "책상 정리하기", start: "10 AM", end: "11 AM", bgColor: .blue)
                            MyCard(icon: "tray.fill", title: "책상 정리하기", start: "10 AM", end: "11 AM", bgColor: .blue)
                            MyCard(icon: "tray.fill", title: "책상 정리하기", start: "10 AM", end: "11 AM", bgColor: .blue)
                            MyCard(icon: "tray.fill", title: "책상 정리하기", start: "10 AM", end: "11 AM", bgColor: .blue)
                        }
             
                    }
                }.padding(.horizontal, 20)
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 60, height: 60)
                    .overlay(
                        Image(systemName: "plus")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    )
                    .padding(.trailing, 10)
                    .shadow(radius: 20)
            }
            .navigationBarTitle(Text("메인"))
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
