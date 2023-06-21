import express from "express";
import { db } from "../firebase";
import { DonationItem } from "../../types";
const getRoutes = express()
getRoutes.use(express.json())

// Place Routes Here
getRoutes.get('/donationItems', async (req, res) => {
    try {
        const snapshot = await db.collection('donationItems').get()
        const donationItems: any[] = []
        snapshot.forEach(doc => {
            donationItems.push(doc.data())
        })
        res.status(200).send(donationItems)
    } catch (error) {
        return res.status(400).send("An Error Occured" + error)
    }
})

getRoutes.get('/donationItems/:id', async (req, res) => {
    try {
        const snapshot = await db.collection('donationItems').doc(req.params.id).get()
        const donationItem = snapshot.data()
        res.status(200).send(donationItem)
    } catch (error) {
        return res.status(400).send("An Error Occured" + error)
    }
})

getRoutes.get('/users', async (req, res) => {
    try {
        const snapshot = await db.collection('users').get()
        const users: any[] = []
        snapshot.forEach(doc => {
            users.push(doc.data())
        })
        res.status(200).send(users)
    } catch (error) {
        return res.status(400).send("An Error Occured" + error)
    }
})


getRoutes.get('/users/:id', async (req, res) => {
    try {
        const snapshot = await db.collection('users').doc(req.params.id).get()
        const user = snapshot.data()
        res.status(200).send(user)
    } catch (error) {
        return res.status(400).send("An Error Occured" + error)
    }
})


getRoutes.get('/reviews', async (req, res) => {
    try {
        const snapshot = await db.collection('reviews').get()
        const reviews: any[] = []
        snapshot.forEach(doc => {
            reviews.push(doc.data())
        })
        res.status(200).send(reviews)
    } catch (error) {
        return res.status(400).send("An Error Occured" + error)
    }
})


getRoutes.get('/reviews/:id', async (req, res) => {
    try {
        const snapshot = await db.collection('reviews').doc(req.params.id).get()
        const review = snapshot.data()
        res.status(200).send(review)
    } catch (error) {
        return res.status(400).send("An Error Occured" + error)
    }
})


getRoutes.get('/coupons', async (req, res) => {
    try {
        const snapshot = await db.collection('coupons').get()
        const coupons: any[] = []
        snapshot.forEach(doc => {
            coupons.push(doc.data())
        })
        res.status(200).send(coupons)
    } catch (error) {
        return res.status(400).send("An Error Occured" + error)
    }
})


getRoutes.get('/coupons/:id', async (req, res) => {
    try {
        const snapshot = await db.collection('coupons').doc(req.params.id).get()
        const coupon = snapshot.data()
        res.status(200).send(coupon)
    } catch (error) {
        return res.status(400).send("An Error Occured" + error)
    }
})


getRoutes.get('/payments', async (req, res) => {
    try {
        const snapshot = await db.collection('payment').get()
        const payments: any[] = []
        snapshot.forEach(doc => {
            payments.push(doc.data())
        })
        res.status(200).send(payments)
    } catch (error) {
        return res.status(400).send("An Error Occured" + error)
    }
})


getRoutes.get('/payments/:id', async (req, res) => {
    try {
        const snapshot = await db.collection('payment').doc(req.params.id).get()
        const payment = snapshot.data()
        res.status(200).send(payment)
    } catch (error) {
        return res.status(400).send("An Error Occured" + error)
    }
})



export default getRoutes