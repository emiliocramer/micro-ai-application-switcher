import SwiftUI

struct ContentView: View {
    @ObservedObject var keyboardManager = KeyboardManager()
    @State private var detectedApps: [String] = []
    @State private var showLayerCreationPopup: Bool = false
    @State private var appForLayerCreation: String = ""
    @State private var availableLayers: [String] = ["Xcode", "Photoshop"]
    @State private var activeLayer: String = "Xcode"

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

            AppConnectivityListView(detectedApps: detectedApps, addLayerAction: { app in
                withAnimation {
                    appForLayerCreation = app
                    showLayerCreationPopup = true
                }
            })

            LayerManagementView(availableLayers: availableLayers, activeLayer: activeLayer, switchToLayer: switchToLayer(_:))

        }
        .padding()
        .onAppear {
            keyboardManager.startDetection()
            fetchRunningApps()
        }
        .sheet(isPresented: $showLayerCreationPopup, content: {
            LayerCreationPopupView(appName: appForLayerCreation, addLayer: { newLayer in
                self.availableLayers.append(newLayer)
                self.showLayerCreationPopup = false
            }, isPresented: $showLayerCreationPopup)
        })
    }

    func fetchRunningApps() {
        let ws = NSWorkspace.shared
        let runningApps = ws.runningApplications.filter { $0.activationPolicy == .regular }
        detectedApps = runningApps.compactMap { $0.localizedName }
    }

    func switchToLayer(_ layer: String) {
        activeLayer = layer
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
