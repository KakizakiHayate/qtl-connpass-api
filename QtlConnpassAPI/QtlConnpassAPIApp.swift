//
//  QtlConnpassAPIApp.swift
//  QtlConnpassAPI
//
//  Created by 柿崎逸 on 2023/04/25.
//

import SwiftUI

@main
struct QtlConnpassAPIApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            SearchView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
