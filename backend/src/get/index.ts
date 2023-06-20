import express from "express";
import { db } from "../firebase";
const getRoutes = express()
getRoutes.use(express.json())

// Place Routes Here
getRoutes.post("/user", async (req, res) =>  {
    const user = await db.collection('users').add({
        'hello': 'world'
    });
    res.send(user);
});

export default getRoutes