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
                    .frame(minWidth: 1280, maxWidth: 1280, minHeight: 530, maxHeight: 530)
            }
            .windowStyle(HiddenTitleBarWindowStyle())
        }
}
