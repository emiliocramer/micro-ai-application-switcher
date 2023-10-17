import SwiftUI

struct KeymapConfigView: View {
    var activeLayer: Layer?
    @State private var keys: [String]
    @State private var firmwarePath: String = ""

    init(activeLayer: Layer?) {
        self.activeLayer = activeLayer
        _keys = State(initialValue: activeLayer?.keyMappings ?? [".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", "."])
    }

    var body: some View {
        let displayName = "\(activeLayer?.name ?? "Default")'s Keymapping"
        
        return VStack {
            Text(displayName)
                .font(.headline)
                .padding()

            VStack {
                HStack {
                    Spacer()
                    KeyView(keyMapping: $keys[0])
                    KeyView(keyMapping: $keys[1])
                    Spacer()
                }
                HStack {
                    KeyView(keyMapping: $keys[2])
                    KeyView(keyMapping: $keys[3])
                    KeyView(keyMapping: $keys[4])
                    KeyView(keyMapping: $keys[5])
                }
                HStack {
                    KeyView(keyMapping: $keys[6])
                    KeyView(keyMapping: $keys[7])
                    KeyView(keyMapping: $keys[8])
                    KeyView(keyMapping: $keys[9])
                }
                HStack {
                    Spacer()
                    KeyView(keyMapping: $keys[10])
                    KeyView(keyMapping: $keys[11])
                    Spacer()
                }
            }

            HStack {
                TextField("Enter firmware path", text: $firmwarePath)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.leading, .trailing])

                Button("Flash Keymap", action: flashKeymap)
                    .padding()
                    .disabled(firmwarePath.isEmpty)
            }
            .padding()
        }
    }
    
    func flashKeymap() {
        let keymapString = keys.joined(separator: ", ")
        let success = KeyboardBridge().saveKeymap(keymapString, forVendorID: 0x574c, productID: 0xe6e3)
        if success {
            print("Successfully flashed the keymap!")
        } else {
            print("Failed to flash the keymap!")
        }
    }
}
