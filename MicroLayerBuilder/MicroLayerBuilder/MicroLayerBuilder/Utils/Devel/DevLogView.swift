import Foundation
import SwiftUI

struct DevLogView: View {
    var availableLayers: [Layer]
    var activeLayer: Layer?

    var body: some View {
        VStack(alignment: .leading) {
            Text("Development Log").font(.headline).padding(.bottom, 10)
            
            if let activeLayer = activeLayer {
                Text("Active Layer: \(activeLayer.description)").padding(.bottom, 10)
            } else {
                Text("Active Layer: None").padding(.bottom, 10)
            }
            
            Text("Available Layers:").padding(.top, 10)
            
            ForEach(availableLayers, id: \.id) { layer in
                Text(layer.description).padding(.top, 5)
            }
        }
        .padding()
        .background(Color.white.opacity(0.7))
        .cornerRadius(10)
    }
}
