//
//  ContentView.swift
//  Grid
//
//  Created by 권석기 on 9/11/24.
//

import SwiftUI


struct ContentView: View {
    private let randomString = ["Hello", "world", "Swift", "SwiftUI", "iOS", "Java", "C++", "JavaScript", "Python"]
    
    var body: some View {
        // GridItem으로 열에 크기, 정렬, 간격을 지정
        let item = GridItem(.flexible(), spacing: 12, alignment: .leading)
        let columns = Array(repeating: item, count: 3)
        
        // LazyVGrid로 열에 최대 몇개의 행이 배치될지 정할 수 있다
        // spacing: row사이 간격
        LazyVGrid(columns: columns, alignment: .leading, spacing: 12, content: {
            ForEach(randomString, id: \.self) { text in
                Text(text)
                    .padding(5)
                    .background(.red)
                    .frame(alignment: .leading)
            }
        })
        .background(.blue)
    }
}

#Preview {
    ContentView()
}
