//
//  WeeklyView.swift
//  State_Binding_EnviromnetObject
//
//  Created by SeokkiKwon on 12/10/23.
//

import SwiftUI

struct WeeklyView: View {
    @Binding var count: Int
    
    // 바인딩된 값이 안들어오는 경우 처리
    init(count: Binding<Int> = .constant(99)) {
        // View 내부의 바인딩 변수는 self가 아닌 _변수명 으로 해야한다.
        _count = count
    }
    var body: some View {
        VStack {
            Text("주말에도 빡코딩 count: \(count)")
                .padding()
            Button(action: {
                count += 1
            }, label: {
                Text("카운트 업")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
        }
    }
}

//#Preview {
//    WeeklyView()
//}
