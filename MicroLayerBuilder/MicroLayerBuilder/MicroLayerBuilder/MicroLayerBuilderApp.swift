//
//  MicroLayerBuilderApp.swift
//  MicroLayerBuilder
//
//  Created by Emilio Cramer on 2023-10-15.
//

import SwiftUI

@main
struct MicroLayerBuilderApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
