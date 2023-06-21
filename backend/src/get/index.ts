import express from "express";
import { db } from "../firebase";
import { DonationItem } from "../../types";
const getRoutes = express()
getRoutes.use(express.json())

// Place Routes Here
getRoutes.get('/donationItems', async (req, res) => {
    try {
        const snapshot = await db.collection('donationItems').get()
        const donationItems: DonationItem[] = []
        snapshot.forEach(doc => {
            donationItems.push(doc.data() as DonationItem)
        })
        res.status(200).send(donationItems)
    } catch (error) {
        return res.status(400).send("An Error Occured" + error)
    }
})

export default getRoutes