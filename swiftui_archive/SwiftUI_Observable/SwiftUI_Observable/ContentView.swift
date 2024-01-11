//
//  ContentView.swift
//  SwiftUI_Observable
//
//  Created by SeokKi Kwon on 2023/12/15.
//

import SwiftUI



struct ContentView: View {
    @State var randomNumber = 0
    var body: some View {
        VStack {
        Text("Random number is: \(randomNumber)")
            Button(action: {
                randomNumber = (0..<1000).randomElement()!
            }, label: {
                Text("Randomize number")
            })
            CounterView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
