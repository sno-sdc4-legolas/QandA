require('dotenv').config();
const express = require('express');

const PORT = process.env.PORT || 8080;
const app = express();

app.use(express.json());

app.listen(PORT, () => {
  console.log(`Listening on port ${PORT}`)
});