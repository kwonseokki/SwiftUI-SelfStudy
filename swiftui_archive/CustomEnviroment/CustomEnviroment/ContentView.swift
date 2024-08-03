//
//  ContentView.swift
//  CustomEnviroment
//
//  Created by 권석기 on 8/4/24.
//

import SwiftUI



struct ContentView: View {
    @State private var count = 0
    
    var body: some View {
        VStack {
            CountView()
            
            CountView()
                .environment(\.customCount, count)
            
            Button(action: {
                count += 1
            }, label: {
                Text("Button")
            })
        }
        .padding()
    }
}

struct CountView: View {
    @Environment(\.customCount) private var count
    
    var body: some View {
        VStack {
            Text("\(count)")
        }
    }
}

#Preview {
    ContentView()
}
