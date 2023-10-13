async function checkKeyboard() {
    console.log("...beginning keyboard check")
    try {
        const devices = await navigator.hid.requestDevice({
            filters: [{vendorId: YOUR_KEYBOARD_VENDOR_ID}]
        });

        if (devices.length === 0) {
            console.log("No devices found")
            alert('No device found');
            return;
        }

        const device = devices[0];
        await device.open();
        console.log('Device opened:', device);
        // Now you can communicate with the device
    } catch (error) {
        console.error('Error:', error);
    }
}