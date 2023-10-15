import Foundation
import IOKit
import IOKit.hid

class KeyboardManager: ObservableObject {
    var manager: IOHIDManager?
    var devices: CFSet?
    let targetVendorID: Int32 = 0x574c  // Example Vendor ID
    let targetProductID: Int32 = 0xe6e3  // Example Product ID
    @Published var isKeyboardConnected: Bool = false

    init() {
        manager = IOHIDManagerCreate(kCFAllocatorDefault, IOOptionBits(kIOHIDOptionsTypeNone))
        setupCallbacks()
    }

    func startDetection() {
        guard let manager = manager else { return }
        
        let deviceCriteria = [
            kIOHIDVendorIDKey: targetVendorID,
            kIOHIDProductIDKey: targetProductID
        ] as CFDictionary

        IOHIDManagerSetDeviceMatching(manager, deviceCriteria)
        IOHIDManagerScheduleWithRunLoop(manager, CFRunLoopGetCurrent(), CFRunLoopMode.defaultMode.rawValue)
        IOHIDManagerOpen(manager, IOOptionBits(kIOHIDOptionsTypeNone))
    }

    private func setupCallbacks() {
        guard let manager = manager else { return }
        
        IOHIDManagerRegisterDeviceMatchingCallback(manager, { (context, result, sender, device) in
            let this = Unmanaged<KeyboardManager>.fromOpaque(context!).takeUnretainedValue()
            this.isKeyboardConnected = true
        }, UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque()))

        IOHIDManagerRegisterDeviceRemovalCallback(manager, { (context, result, sender, device) in
            let this = Unmanaged<KeyboardManager>.fromOpaque(context!).takeUnretainedValue()
            this.isKeyboardConnected = false
        }, UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque()))
    }
}
