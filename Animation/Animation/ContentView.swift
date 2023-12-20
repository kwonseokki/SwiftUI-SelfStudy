//
//  ContentView.swift
//  Animation
//
//  Created by SeokKi Kwon on 2023/12/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Linear")
            LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 200, height: 200)
            
            Text("Radical")
            RadialGradient(colors: [.purple, .blue], center: .center, startRadius: 80, endRadius: 10)
                .frame(width: 200, height: 200)
            
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
