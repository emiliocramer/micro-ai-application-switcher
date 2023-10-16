import SwiftUI

struct LayerManagementView: View {
    var availableLayers: [String]
    var activeLayer: String
    var switchToLayer: (String) -> Void

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(availableLayers, id: \.self) { layer in
                    if layer == activeLayer {
                        Text(layer)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    } else {
                        Button(action: { switchToLayer(layer) }) {
                            Text(layer)
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .onHover { inside in
                            if inside {
                                NSCursor.pointingHand.set()
                            } else {
                                NSCursor.arrow.set()
                            }
                        }
                    }
                }
            }
            .padding(.bottom, 20)
        }
    }
}
