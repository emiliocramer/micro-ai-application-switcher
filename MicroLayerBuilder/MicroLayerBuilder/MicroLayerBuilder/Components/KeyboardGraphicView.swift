import Foundation
import SwiftUI

struct KeyboardGraphicView: View {
    var activeLayer: String

    // Assuming you have different key layouts for different layers
    var keyLayout: [String] {
        switch activeLayer {
        case "Xcode":
            return ["Cmd", "Shift", "A", "B"]
        case "Photoshop":
            return ["Alt", "Ctrl", "Z", "X"]
        default:
            return []
        }
    }

    var body: some View {
        VStack(spacing: 10) {
            ForEach(keyLayout, id: \.self) { key in
                Text(key)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
        }
        .frame(width: 200) // Fixed width for our keyboard graphic view
        .background(Color.white.opacity(0.1))
        .cornerRadius(20)
        .padding()
    }
}
