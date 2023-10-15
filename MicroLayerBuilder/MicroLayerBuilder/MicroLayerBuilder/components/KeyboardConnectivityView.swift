import SwiftUI

struct KeyboardConnectivityView: View {
    @ObservedObject var keyboardManager: KeyboardManager

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(keyboardManager.isKeyboardConnected ? Color.green : Color.gray)
            .frame(height: 50)
            .overlay(Text(keyboardManager.isKeyboardConnected ? "Micro Pad Connected" : "Connect your Work Louder Micro Pad to begin"))
    }
}
