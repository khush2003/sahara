import express from "express";
import { db } from "../firebase";
import { DonationItem } from "../../types";
const postRoutes = express()
postRoutes.use(express.json())

postRoutes.post("/donationItem", async (req, res) =>  {
    const donationItem = await db.collection('donationItems').add(req.body);
    res.status(200).send(donationItem);
});

postRoutes.post("/users/:id", async (req, res) =>  {
    const userId = req.params.id;
    const user = await db.collection('users').doc(userId).set(req.body
    );
    res.status(200).send(userId);
});

postRoutes.post("/reviews", async (req, res) =>  {

    const user = await db.collection('reviews').add(req.body
    );
    res.status(200).send(user);
});

export default postRoutes