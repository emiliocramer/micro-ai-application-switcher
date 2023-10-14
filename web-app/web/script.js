async function checkKeyboard() {
    console.log("...beginning keyboard check")
    try {
        const devices = await navigator.hid.requestDevice({
            filters: [{vendorId: 0x574c}]
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
