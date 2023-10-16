import SwiftUI

struct LayerConfigView: View {
    @ObservedObject var keyboardManager: KeyboardManager
    @Binding var detectedApps: [AppDetails]
    @Binding var showLayerCreationPopup: Bool
    @Binding var appForLayerCreation: String
    @Binding var availableLayers: [String]
    @Binding var activeLayer: String

    var body: some View {
        VStack(spacing: 20) {
            Text("It's time for the perfect keyboard.")
                .padding(.top, 20)
                .font(.title)

            KeyboardConnectivityView(keyboardManager: keyboardManager)

            Text("Connected Apps:")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
                .padding(.bottom, -10)

            AppConnectivityListView(detectedApps: detectedApps) { app in
                withAnimation {
                    appForLayerCreation = app
                    showLayerCreationPopup = true
                }
            }

            LayerManagementView(availableLayers: availableLayers, activeLayer: activeLayer) { layer in
                activeLayer = layer
            }
        }
    }
}
