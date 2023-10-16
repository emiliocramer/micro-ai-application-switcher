import SwiftUI

struct KeymapConfigView: View {
    // Assuming each key is represented by a string. You may need a more complex data structure.
    @State private var keys: [String] = ["KC_TAB", "KC_Q", "KC_W", "KC_E", "KC_TAB", "KC_Q", "KC_W", "KC_E", "KC_TAB", "KC_Q", "KC_W", "KC_E"]

    var body: some View {
        VStack {
            Text("QMK Keymapping")
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
                Button("Flash Keymap", action: flashKeymap)
                                .padding()
            }
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


