//
//  CustomEnviromentApp.swift
//  CustomEnviroment
//
//  Created by 권석기 on 8/4/24.
//

import SwiftUI

struct CountKey: EnvironmentKey {
    static var defaultValue: Int = 100
}

// EnviromentValues에 저장된 값을 가져온다
extension EnvironmentValues {
    var customCount: Int {
        get { self[CountKey.self] }
        set { self[CountKey.self] = newValue }
    }
}

@main
struct CustomEnviromentApp: App {
    @State private var count = 0
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
