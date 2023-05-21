//
//  DataController.swift
//  QtlConnpassAPI
//
//  Created by 柿崎逸 on 2023/05/20.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    static let shared = DataController()
    let container = NSPersistentContainer(name: "SearchLogModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
