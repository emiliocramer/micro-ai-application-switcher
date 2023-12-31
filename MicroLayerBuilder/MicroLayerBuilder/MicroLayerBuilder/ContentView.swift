import SwiftUI

struct ContentView: View {
    @ObservedObject var keyboardManager = KeyboardManager()
        @State private var detectedApps: [AppDetails] = []
        @State private var showLayerCreationPopup: Bool = false
        @State private var appForLayerCreation: String = ""
        @State private var availableLayers: [Layer] = []
        @State private var activeLayer: Layer?


        var body: some View {
            HStack(spacing: 20) {
                LayerConfigView(keyboardManager: keyboardManager, detectedApps: $detectedApps, showLayerCreationPopup: $showLayerCreationPopup, appForLayerCreation: $appForLayerCreation, availableLayers: $availableLayers, activeLayer: $activeLayer)
                    .frame(width: 700, height: 500)
                    .padding(10)

                KeymapConfigView(activeLayer: $activeLayer.wrappedValue)
                    .frame(width: 500, height: 500)
                    .background(Color.gray.opacity(0.2).cornerRadius(30))
                    .padding(10)
                
                #if DEBUG
                DevLogView(availableLayers: availableLayers, activeLayer: activeLayer)
                    .frame(width: 200)
                #endif
                
            }
            .onAppear {
                keyboardManager.startDetection()
                fetchRunningApps()
                self.availableLayers = StorageManager().fetchLayers()
            }
            .sheet(isPresented: $showLayerCreationPopup, content: {
                LayerCreationPopupView(appName: appForLayerCreation, addLayer: { newLayer in
                    self.availableLayers.append(newLayer)
                    StorageManager().save(layers: availableLayers)
                    self.showLayerCreationPopup = false
                }, isPresented: $showLayerCreationPopup)
            })
            .frame(width: 1230, height: 530)
        }

    func fetchRunningApps() {
        let ws = NSWorkspace.shared
        let runningApps = ws.runningApplications.filter { $0.activationPolicy == .regular }
        detectedApps = runningApps.compactMap {
            guard let name = $0.localizedName, let icon = $0.icon else { return nil }
            return AppDetails(name: name, icon: icon)
        }
    }
    
    func switchToLayer(_ layer: Layer) {
        activeLayer = layer
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
