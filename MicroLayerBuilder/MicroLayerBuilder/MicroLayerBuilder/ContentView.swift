import SwiftUI



struct ContentView: View {
    @ObservedObject var keyboardManager = KeyboardManager()
    @State private var detectedApps: [String] = []

    var body: some View {
        VStack(spacing: 20) {
            Text("It's time for the perfect keyboard.")
                .font(.title)

            RoundedRectangle(cornerRadius: 10)
                .fill(keyboardManager.isKeyboardConnected ? Color.green : Color.gray)
                .frame(height: 50)
                .overlay(Text(keyboardManager.isKeyboardConnected ? "Micro Pad Connected" : "Connect your Work Louder Micro Pad to begin"))

            Text("Connected Apps:")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
                .padding(.bottom, -10)
            
            List(detectedApps, id: \.self) { app in
                Text(app)
            }

            HStack {
                Button("Switch to Xcode Layer", action: switchToXcodeLayer)
                Button("Switch to Photoshop Layer", action: switchToPhotoshopLayer)
            }
        }
        .padding()
        .onAppear {
            keyboardManager.startDetection()
            fetchRunningApps()

        }
    }
    
    func fetchRunningApps() {
        let ws = NSWorkspace.shared
        let runningApps = ws.runningApplications
        detectedApps = runningApps.compactMap { $0.localizedName }
    }

    func switchToXcodeLayer() {
        // Logic to switch to Xcode layer
    }

    func switchToPhotoshopLayer() {
        // Logic to switch to Photoshop layer
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
