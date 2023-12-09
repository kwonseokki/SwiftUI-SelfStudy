//
//  TodayView.swift
//  State_Binding_EnviromnetObject
//
//  Created by SeokkiKwon on 12/10/23.
//

import SwiftUI

struct BeforeBadView: View {
    @EnvironmentObject var viewModel: MyViewModel
    @Binding var count: Int
    
    @State var title: String = "타이틀 없음"
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 26))
                .fontWeight(.bold)
                .padding()
            Text("\(count)일차")
            Button(action: {
                count += 1
                viewModel.appTitle = "빡코딩의 일상\(count)일차"
            }, label: {
                Text("카운트 업")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
        }.onReceive(viewModel.$appTitle, perform: { recivedAppTitle in
            print("BeforeBadView - recivedAppTitle: \(recivedAppTitle)")
            title = recivedAppTitle
        })
    }
}

//#Preview {
//    BeforeBadView(count: T##Binding<Int>)
//}
