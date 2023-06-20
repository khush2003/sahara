import express from "express";
import { db } from "../firebase";
const deleteRoutes = express()
deleteRoutes.use(express.json())

// Place Routes Here
deleteRoutes.post("/user", async (req, res) =>  {
    const user = await db.collection('users').add({
        'hello': 'world'
    });
    res.send(user);
});

export default deleteRoutes