const express = require('express');
const app = express();
const port = 4000;
const { db } = require('./firebase');
app.use(express.json());

app.get('/', (req, res) => {
  return res.send('Hello World!');
});

// Place Routes Here
app.post("/addRecord", async (req, res) =>  {
    const newCollection = db.collection("newCollection");
    const fileRef = db.collection("files")
    const result = 1;
    await fileRef.get().then((snapshot) => {
        const result = snapshot.docs
    })

  res.status(200).send(result);
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});