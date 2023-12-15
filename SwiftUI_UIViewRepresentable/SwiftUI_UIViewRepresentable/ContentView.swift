//
//  ContentView.swift
//  SwiftUI_UIViewRepresentable
//
//  Created by SeokKi Kwon on 2023/12/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MyUILabel(text: "Presented with UIViewReprentable")
            MyScrollView(text: "Swift")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
