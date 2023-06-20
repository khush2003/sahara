import express from "express";
import { db } from "../firebase";
const putRoutes = express()
putRoutes.use(express.json())

// Place Routes Here
putRoutes.post("/user", async (req, res) =>  {
    const user = await db.collection('users').add({
        'hello': 'world'
    });
    res.send(user);
});

export default putRoutes