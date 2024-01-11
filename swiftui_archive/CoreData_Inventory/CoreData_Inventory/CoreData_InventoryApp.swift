//
//  CoreData_InventoryApp.swift
//  CoreData_Inventory
//
//  Created by SeokKi Kwon on 2023/12/28.
//

import SwiftUI

@main
struct CoreData_InventoryApp: App {
    // 앱의 진입점에 영구객체를 초기화
    let persistentceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistentceController.container.viewContext)
        }
    }
}
