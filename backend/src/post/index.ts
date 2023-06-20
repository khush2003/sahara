import express from "express";
import db from '../firebase';
const postRoutes = express()
postRoutes.use(express.json())

// Place Routes Here
postRoutes.post("/addRecord", async (req, res) =>  {
    const newCollection = db.collection("newCollection");
    const fileRef = db.collection("files")
    const result = 1;
    await fileRef.get().then((snapshot) => {
        const result = snapshot.docs
    })

  res.status(200).send(result);
});

export default postRoutes