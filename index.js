const express = require('express');
const port = process.env.PORT || 3000;
const app = express();

// Hello World for index page
app.get('/', function (req, res) {
    return res.send("Hello World from Prabhanjan Nayak!");
})
// Start the server
app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
});
  
