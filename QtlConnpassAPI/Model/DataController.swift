//
//  DataController.swift
//  QtlConnpassAPI
//
//  Created by 柿崎逸 on 2023/05/20.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    // MARK: - Properties
    static let shared = DataController()
    let container = NSPersistentContainer(name: "SearchLogModel")
    
    // MARK: - Initialize
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
