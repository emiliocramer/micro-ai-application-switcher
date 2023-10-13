const express = require('express');
const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
    res.sendFile(__dirname + '/web/index.html');
});

app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}/`);
});
