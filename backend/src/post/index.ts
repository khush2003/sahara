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

postRoutes.post("/review", async (req, res) =>  {
    const user = await db.collection('reviews').add(req.body
    );
    res.status(200).send(user);
});

postRoutes.post("/coupon", async (req, res) =>  {
    const coupon = await db.collection('coupons').add(req.body
    );
    res.status(200).send(coupon);
});

postRoutes.post("/availableCoupons/:id", async (req, res) =>  {
    const availableCouponId = req.params.id;
    const availableCoupon = await db.collection('availableCoupons').doc(availableCouponId).set(req.body
    );
    res.status(200).send(availableCouponId);
});

// Create a new chatRoom
postRoutes.post("/chatRoom", async (req, res) =>  {
    const chatRoom = await db.collection('chatRooms').add(req.body
    );
    res.status(200).send(chatRoom);
});

// Create a new message
postRoutes.post("/message", async (req, res) =>  {
    const message = await db.collection('messages').add(req.body
    );
    res.status(200).send(message);
});


export default postRoutes