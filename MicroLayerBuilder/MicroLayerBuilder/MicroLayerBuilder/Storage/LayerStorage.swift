//
//  LayerStorage.swift
//  MicroLayerBuilder
//
//  Created by Emilio Cramer on 2023-10-17.
//

import Foundation

class StorageManager {
    private let layersKey = "layers_key"
    
    func save(layers: [Layer]) {
        if let encoded = try? JSONEncoder().encode(layers) {
            UserDefaults.standard.set(encoded, forKey: layersKey)
        }
    }
    
    func fetchLayers() -> [Layer] {
        if let data = UserDefaults.standard.data(forKey: layersKey),
           let decoded = try? JSONDecoder().decode([Layer].self, from: data) {
            return decoded
        }
        return []
    }
}
