import SwiftUI

struct LayerCreationPopupView: View {
    var appName: String
    var addLayer: (String) -> Void

    @Binding var isPresented: Bool

    @State private var isLayerNameValid: Bool = true
    @State private var layerName: String

    init(appName: String, addLayer: @escaping (String) -> Void, isPresented: Binding<Bool>) {
        self.appName = appName
        self.addLayer = addLayer
        self._isPresented = isPresented
        self._layerName = State(initialValue: appName)
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Create Layer for \(appName)")
                .font(.title)

            TextField("Layer Name", text: $layerName)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .onChange(of: layerName) { newValue, oldValue in
                    isLayerNameValid = !newValue.isEmpty
                }

            Button(action: {
                addLayer(layerName)
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
        .padding()
    }
}
