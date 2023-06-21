import express from "express";
import { db } from "../firebase";
import { DonationItem } from "../../types";
const postRoutes = express()
postRoutes.use(express.json())

// Place Routes Here
postRoutes.post("/user", async (req, res) =>  {
    const user = await db.collection('users').add({
        'hello': 'world'
    });
    res.status(200).send(user);
});

export default postRoutes