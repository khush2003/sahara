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
            var donationItemsWithId = {
                donationId: doc.id,
                ...doc.data(),
            }
            donationItems.push(donationItemsWithId)
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
        const user = snapshot.data();
        const result = { ...user, uid: req.params.id};
        res.status(200).send(result)
    } catch (error) {
        return res.status(400).send("An Error Occured" + error)
    }
})

//Get user's coupons
getRoutes.get('/users/:userId/discountCoupon/', async (req, res) => {
    try {
        const snapshot = await db.collection('users').doc(req.params.userId).get()
        const couponList: any[] = []
        const userData = snapshot.data();
        if (userData && userData.discountCoupon) {         
            for(const couponId of userData.discountCoupon){
                const couponDetail = await db.collection('coupons').doc(couponId).get()
                const couponDetailData = couponDetail.data();
                if (couponDetailData) {
                    // Add the couponId to the couponDetailData object
                    couponDetailData.couponId = couponId;
                    couponList.push(couponDetailData);
                  }
            }

          }
        res.status(200).send(couponList)
    } catch (error) {
        return res.status(400).send("An Error Occured" + error)
    }
})


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


getRoutes.get('/reviews', async (req, res) => {
    try {
        const snapshot = await db.collection('reviews').get()
        const donationItems: any[] = []
        snapshot.forEach(doc => {
            var reviewsWithId = {
                reviewId: doc.id,
                ...doc.data(),
            }
            donationItems.push(reviewsWithId)
        })
        res.status(200).send(donationItems)
    } catch (error) {
        return res.status(400).send("An Error Occured" + error)
    }
})

getRoutes.get('/eachUsers', async (req, res) => {
    try {
      const { userName } = req.query;
      const snapshot = await db.collection('users').where('userName', '==', userName).get();
      const users: FirebaseFirestore.DocumentData[] = [];
      snapshot.forEach(doc => {
        users.push(doc.data());
      });
      res.status(200).send(users);
    } catch (error) {
      return res.status(400).send("An Error Occured" + error);
    }
  });

  getRoutes.get('/findCouponFromDiscountCode', async (req, res) => {
    try {
      const { discountCode } = req.query;
      const snapshot = await db.collection('coupons').where('discountCode', '==', discountCode).get();
      const coupons: FirebaseFirestore.DocumentData[] = [];
      snapshot.forEach(doc => {
        coupons.push(doc.data());
      });
      res.status(200).send(coupons);
    } catch (error) {
      return res.status(400).send("An Error Occured" + error);
    }
  });

  getRoutes.get("/availableCoupons", async (req, res) => {
    try {
      const snapshot = await db.collection('availableCoupons').get();
      const availableCoupons: any[]= [];
     
        snapshot.forEach(doc => {
            var couponsWithId = {
                couponId: doc.id,
                ...doc.data(),
            }
            availableCoupons.push(couponsWithId)
        });
      res.status(200).send(availableCoupons);
    } catch (error) {
      console.error('Error fetching available coupons:', error);
      res.status(500).send('Internal server error');
    }
  });


export default getRoutes