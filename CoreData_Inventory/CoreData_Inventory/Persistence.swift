//
//  Persistence.swift
//  CoreData_Inventory
//
//  Created by SeokKi Kwon on 2023/12/28.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    
    init() {
        container = NSPersistentContainer(name: "Products")
        // 영구저장소를 로드한다
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
    }
}
