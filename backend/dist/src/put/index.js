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
const putRoutes = (0, express_1.default)();
putRoutes.use(express_1.default.json());
// Place Routes Here
putRoutes.post("/user", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const user = yield firebase_1.db.collection("users").add({
        hello: "world",
    });
    res.send(user);
}));
putRoutes.put("/users/:id", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const userId = req.params.id;
    const userData = req.body;
    try {
        yield firebase_1.db.collection('users').doc(userId).set(userData, { merge: true });
        res.status(200).send("User updated successfully");
    }
    catch (error) {
        console.error("Error updating user:", error);
        res.status(500).send("Error updating user");
    }
}));
putRoutes.put("/users/:userId/discountCoupon/:couponId", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const userId = req.params.userId;
    const couponId = req.params.couponId;
    try {
        const couponSnapshot = yield firebase_1.db.collection('coupons').doc(couponId).get();
        const couponData = couponSnapshot.data();
        if (couponData) {
            const userSnapshot = yield firebase_1.db.collection('users').doc(userId).get();
            const userData = userSnapshot.data();
            if (userData) {
                const discountCoupon = userData.discountCoupon || [];
                discountCoupon.push(couponId);
                yield firebase_1.db.collection('users').doc(userId).set({ discountCoupon }, { merge: true });
                res.status(200).send("User updated successfully");
            }
            else {
                res.status(404).send("User not found");
            }
        }
        else {
            res.status(404).send("Coupon not found");
        }
    }
    catch (error) {
        console.error("Error updating user:", error);
        res.status(500).send("Error updating user");
    }
}));
putRoutes.put("/allUserName/:id", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const userId = req.params.id;
    const userName = req.body.userName;
    try {
        yield firebase_1.db.collection('users').doc(userId).update({ userName: userName });
        // Write a firebase call to update all donationItem's authorName where authorId = userId
        yield firebase_1.db.collection('donationItems').where('authorId', '==', userId).get().then((querySnapshot) => {
            querySnapshot.forEach((doc) => {
                doc.ref.update({ authorName: userName });
            });
        });
        // Write a firebase call to update all reviews' reviewerName where reviewerId = userId
        yield firebase_1.db.collection('reviews').where('reviewerId', '==', userId).get().then((querySnapshot) => {
            querySnapshot.forEach((doc) => {
                doc.ref.update({ reviewerName: userName });
            });
        });
        // TODO: Same for ImageURL
        res.status(200).send("User updated successfully");
    }
    catch (error) {
        console.error("Error updating user:", error);
        res.status(500).send("Error updating user");
    }
}));
//Write a put method to update donationItem's paymentId
putRoutes.put("/donationItems/:id", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const donationItemId = req.params.id;
    const itemData = req.body;
    try {
        yield firebase_1.db.collection('donationItems').doc(donationItemId).set(itemData, { merge: true });
        res.status(200).send("Donation Item updated successfully");
    }
    catch (error) {
        console.error("Error updating donation item:", error);
        res.status(500).send("Error updating donation item");
    }
}));
//Write a put method to update payment's paymentImageUrlReceiver
putRoutes.put("/payments/:id", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const paymentId = req.params.id;
    const paymentData = req.body;
    try {
        yield firebase_1.db.collection('payments').doc(paymentId).set(paymentData, { merge: true });
        res.status(200).send("Payment updated successfully");
    }
    catch (error) {
        console.error("Error updating payment:", error);
        res.status(500).send("Error updating payment");
    }
}));
exports.default = putRoutes;
