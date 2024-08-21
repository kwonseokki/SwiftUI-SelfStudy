//
//  ContentView.swift
//  AppStorage
//
//  Created by 권석기 on 8/22/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("username") var username: String = "Anonymous"
    
    var body: some View {
        VStack {
            Text("UserDefaults \(UserDefaults.standard.string(forKey: "username") ?? "Anonymous")")
           Text("Welcome, \(username)!")
            
            Button("Log in") {
                username = "@twostraws"
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
