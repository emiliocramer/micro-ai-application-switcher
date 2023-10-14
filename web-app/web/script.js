async function checkKeyboard() {
    console.log("...beginning keyboard check");
    const connectButton = document.getElementById('connectButton');

    try {
        const devices = await navigator.hid.requestDevice({
            filters: [{vendorId: 0x574c}]
        });

        if (devices.length === 0) {
            console.log("No devices found");
            alert('No device found');
            return;
        }

        const device = devices[0];
        await device.open();
        console.log('Device opened:', device);

        // once connected
        connectButton.textContent = "Connected Keyboard";
        connectButton.style.backgroundColor = "green";
        connectButton.style.color = "white";
        connectButton.disabled = true;

    } catch (error) {
        console.error('Error:', error);
    }
}

async function fetchRunningApps() {
    console.log("fetchRunningApps function is being called");
    try {
        const response = await fetch('http://localhost:8080/runningApps');
        const apps = await response.json();
        console.log("f3tching open apps...")
        const supportedApps = ["XCODE", "PHOTOSHOP"];
        const detectedSupportedApps = apps.filter(app => supportedApps.includes(app.toUpperCase()));

        // Update the UI with detected apps
        const container = document.getElementById('detectedApps');
        container.innerHTML = '';  // Clear previous apps
        detectedSupportedApps.forEach(app => {
            const appElement = document.createElement('div');
            appElement.textContent = app;
            container.appendChild(appElement);
        });
        console.log("Detected supported apps:", detectedSupportedApps);
    } catch (error) {
        console.error('Error fetching running apps:', error);
    }
}

fetchRunningApps();
setInterval(fetchRunningApps, 3000);

