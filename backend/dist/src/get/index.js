"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const firebase_1 = require("../firebase");
const getRoutes = (0, express_1.default)();
getRoutes.use(express_1.default.json());
// Place Routes Here
getRoutes.get('/donationItems', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const snapshot = yield firebase_1.db.collection('donationItems').get();
        const donationItems = [];
        snapshot.forEach(doc => {
            var donationItemsWithId = Object.assign({ donationId: doc.id }, doc.data());
            donationItems.push(donationItemsWithId);
        });
        res.status(200).send(donationItems);
    }
    catch (error) {
        return res.status(400).send("An Error Occured" + error);
    }
}));
getRoutes.get('/donationItems/:id', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const snapshot = yield firebase_1.db.collection('donationItems').doc(req.params.id).get();
        const donationItem = snapshot.data();
        res.status(200).send(donationItem);
    }
    catch (error) {
        return res.status(400).send("An Error Occured" + error);
    }
}));
getRoutes.get('/users', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const snapshot = yield firebase_1.db.collection('users').get();
        const users = [];
        snapshot.forEach(doc => {
            users.push(doc.data());
        });
        res.status(200).send(users);
    }
    catch (error) {
        return res.status(400).send("An Error Occured" + error);
    }
}));
getRoutes.get('/users/:id', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const snapshot = yield firebase_1.db.collection('users').doc(req.params.id).get();
        const user = snapshot.data();
        const result = Object.assign(Object.assign({}, user), { uid: req.params.id });
        res.status(200).send(result);
    }
    catch (error) {
        return res.status(400).send("An Error Occured" + error);
    }
}));
//Get Specific coupon of user
// getRoutes.get('/users/:userId/discountCoupon/:couponId', async (req, res) => {
//     try {
//         const snapshot = await db.collection('users').doc(req.params.userId).get()
//         const coupon = snapshot.data();
//         const result = { ...coupon, couponId: req.params.couponId};
//         res.status(200).send(result)
//     } catch (error) {
//         return res.status(400).send("An Error Occured" + error)
//     }
// })
//Get user's coupons
getRoutes.get('/users/:userId/discountCoupon/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const snapshot = yield firebase_1.db.collection('users').doc(req.params.userId).get();
        const couponList = [];
        const userData = snapshot.data();
        if (userData && userData.discountCoupon) {
            for (const couponId of userData.discountCoupon) {
                const couponDetail = yield firebase_1.db.collection('coupons').doc(couponId).get();
                const couponDetailData = couponDetail.data();
                couponList.push(couponDetailData);
            }
        }
        res.status(200).send(couponList);
    }
    catch (error) {
        return res.status(400).send("An Error Occured" + error);
    }
}));
// getRoutes.get('/reviews', async (req, res) => {
//     try {
//         const snapshot = await db.collection('reviews').get()
//         const reviews: any[] = []
//         snapshot.forEach(doc => {
//             reviews.push(doc.data())
//         })
//         res.status(200).send(reviews)
//     } catch (error) {
//         return res.status(400).send("An Error Occured" + error)
//     }
// })
getRoutes.get('/reviews/:id', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const snapshot = yield firebase_1.db.collection('reviews').doc(req.params.id).get();
        const review = snapshot.data();
        res.status(200).send(review);
    }
    catch (error) {
        return res.status(400).send("An Error Occured" + error);
    }
}));
getRoutes.get('/coupons', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const snapshot = yield firebase_1.db.collection('coupons').get();
        const coupons = [];
        snapshot.forEach(doc => {
            coupons.push(doc.data());
        });
        res.status(200).send(coupons);
    }
    catch (error) {
        return res.status(400).send("An Error Occured" + error);
    }
}));
getRoutes.get('/coupons/:id', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const snapshot = yield firebase_1.db.collection('coupons').doc(req.params.id).get();
        const coupon = snapshot.data();
        res.status(200).send(coupon);
    }
    catch (error) {
        return res.status(400).send("An Error Occured" + error);
    }
}));
getRoutes.get('/payments', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const snapshot = yield firebase_1.db.collection('payment').get();
        const payments = [];
        snapshot.forEach(doc => {
            payments.push(doc.data());
        });
        res.status(200).send(payments);
    }
    catch (error) {
        return res.status(400).send("An Error Occured" + error);
    }
}));
getRoutes.get('/payments/:id', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const snapshot = yield firebase_1.db.collection('payment').doc(req.params.id).get();
        const payment = snapshot.data();
        res.status(200).send(payment);
    }
    catch (error) {
        return res.status(400).send("An Error Occured" + error);
    }
}));
getRoutes.get('/reviews', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const snapshot = yield firebase_1.db.collection('reviews').get();
        const donationItems = [];
        snapshot.forEach(doc => {
            var reviewsWithId = Object.assign({ reviewId: doc.id }, doc.data());
            donationItems.push(reviewsWithId);
        });
        res.status(200).send(donationItems);
    }
    catch (error) {
        return res.status(400).send("An Error Occured" + error);
    }
}));
getRoutes.get('/eachUsers', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { userName } = req.query;
        const snapshot = yield firebase_1.db.collection('users').where('userName', '==', userName).get();
        const users = [];
        snapshot.forEach(doc => {
            users.push(doc.data());
        });
        res.status(200).send(users);
    }
    catch (error) {
        return res.status(400).send("An Error Occured" + error);
    }
}));
getRoutes.get("/availableCoupons", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const snapshot = yield firebase_1.db.collection('availableCoupons').get();
        const availableCoupons = [];
        snapshot.forEach(doc => {
            var couponsWithId = Object.assign({ couponId: doc.id }, doc.data());
            availableCoupons.push(couponsWithId);
        });
        res.status(200).send(availableCoupons);
    }
    catch (error) {
        console.error('Error fetching available coupons:', error);
        res.status(500).send('Internal server error');
    }
}));
exports.default = getRoutes;
