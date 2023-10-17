import SwiftUI

struct LayerCreationPopupView: View {
    var appName: String
    var addLayer: (Layer) -> Void

    @Binding var isPresented: Bool

    @State private var isLayerNameValid: Bool = true
    @State private var layerName: String

    init(appName: String, addLayer: @escaping (Layer) -> Void, isPresented: Binding<Bool>) {
        self.appName = appName
        self.addLayer = addLayer
        self._isPresented = isPresented
        self._layerName = State(initialValue: appName)
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Create New Layer")
                .font(.title)

            TextField("Layer Name", text: $layerName)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .onChange(of: layerName) { newValue, oldValue in
                    isLayerNameValid = !newValue.isEmpty
                }

            Button(action: {
                getShortcutsFor(appName: appName) { shortcuts in
                    let defaultKeyMappings = Array(shortcuts.prefix(12))
                    let defaultKeyMappingNames = Array(repeating: appName, count: min(12, shortcuts.count))

                    let newLayer = Layer(applicationName: appName, name: layerName, keyMappings: defaultKeyMappings, KeyMappingNames: defaultKeyMappingNames)
                    addLayer(newLayer)
                }
                isPresented = false
            }) {
                Text("Create Layer")
                    .padding()
                    .foregroundColor(.white)
            }
            .disabled(!isLayerNameValid)
            .background(isLayerNameValid ? Color.blue : Color.gray)
            .cornerRadius(10)
            .onHover { inside in
                if inside {
                    NSCursor.pointingHand.set()
                } else {
                    NSCursor.arrow.set()
                }
            }
        

            Button("Cancel") {
                isPresented = false
            }
            .padding()
        }
        .padding(.horizontal, 100)
        .padding(.vertical, 20)
    }
}
