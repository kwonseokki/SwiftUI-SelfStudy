//
//  ContentView.swift
//  PreferenceKey
//
//  Created by 권석기 on 9/9/24.
//

import SwiftUI

struct RandomNumberKey: PreferenceKey {
    static var defaultValue: Int = 0
    static func reduce(value: inout Int, nextValue: () -> Int) {
        value = nextValue()
    }
}

struct ParentView: View {
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(number)")
               
            
            ChildView()
        }.onPreferenceChange(RandomNumberKey.self, perform: { randomNumber in
            number = randomNumber
        })
    }
}

struct ChildView: View {
    
    var body: some View {
        VStack {
            Text("Child View")
                .preference(key: RandomNumberKey.self, value: Int.random(in: 1...100))
        }
    }
}

struct ContentView: View {
    var body: some View {
        ParentView()
    }
}

#Preview {
    ContentView()
}
