import SwiftUI

struct LayerManagementView: View {
    var availableLayers: [Layer]
    var activeLayer: Layer?
    var switchToLayer: (Layer) -> Void

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(availableLayers, id: \.id) { layer in
                    if layer.name == activeLayer?.name {
                        Text(layer.name)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    } else {
                        Button(action: { switchToLayer(layer) }) {
                            Text(layer.name)
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
