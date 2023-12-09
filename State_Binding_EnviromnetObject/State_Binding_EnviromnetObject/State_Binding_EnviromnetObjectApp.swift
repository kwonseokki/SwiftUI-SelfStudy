//
//  State_Binding_EnviromnetObjectApp.swift
//  State_Binding_EnviromnetObject
//
//  Created by SeokkiKwon on 12/10/23.
//

import SwiftUI

@main
struct State_Binding_EnviromnetObjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MyViewModel())
        }
    }
}
