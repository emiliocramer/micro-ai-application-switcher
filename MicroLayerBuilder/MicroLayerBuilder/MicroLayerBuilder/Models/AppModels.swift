//
//  AppModels.swift
//  MicroLayerBuilder
//
//  Created by Emilio Cramer on 2023-10-16.
//

import Foundation
import AppKit

struct AppDetails {
    let name: String
    let icon: NSImage?
}

struct Layer: Codable, Identifiable {
    var id = UUID()
    let applicationName: String
    var name: String
    var keyMappings: [String]
    var KeyMappingNames: [String]
}

extension Layer: CustomStringConvertible {
    var description: String {
        """
        Name: \(name)
        Application Name: \(applicationName)
        Key Mappings: \(keyMappings)
        """
    }
}
