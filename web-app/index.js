const express = require('express');
const app = express();
const PORT = 3000;
const path = require('path');  // Add this line

// Update this line to use the path module for better directory handling
app.use(express.static(path.join(__dirname, 'web')));

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'web', 'index.html'));  // Updated this line too
});

app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}/`);
});
