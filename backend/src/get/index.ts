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


  // Get all messages for a user chat, all messages include when I am the sender and he is the reciver or he is the sender and I am the reciver
getRoutes.get('/messages/:userId/:otherUserId', async (req, res) => {
    try {
        const snapshot = await db.collection('messages').where('senderId', '==', req.params.userId).where('receiverId', '==', req.params.otherUserId).get();
        const snapshot2 = await db.collection('messages').where('senderId', '==', req.params.otherUserId).where('receiverId', '==', req.params.userId).get();
        const messages: FirebaseFirestore.DocumentData[] = [];
        snapshot.forEach(doc => {
            messages.push(doc.data());
        });
        snapshot2.forEach(doc => {
            messages.push(doc.data());
        });
        res.status(200).send(messages);
    } catch (error) {
        return res.status(400).send("An Error Occured" + error);
    }
});

// Get all chatRooms
getRoutes.get('/chatRooms', async (req, res) => {
    try {
        const snapshot = await db.collection('chatRooms').get();
        const chatRooms: FirebaseFirestore.DocumentData[] = [];
        snapshot.forEach(doc => {
            chatRooms.push({
                chatRoomId: doc.id,
                ...doc.data(),
            });
        });
        res.status(200).send(chatRooms);
    } catch (error) {
        return res.status(400).send("An Error Occured" + error);
    }
});


// Get all chatrooms for user (if authorId == id or userId == id)
getRoutes.get('/chatRooms/:id', async (req, res) => {
    try {
        const snapshot = await db.collection('chatRooms').where('authorId', '==', req.params.id).get();
        const snapshot2 = await db.collection('chatRooms').where('userId', '==', req.params.id).get();
        const chatRooms: FirebaseFirestore.DocumentData[] = [];
        snapshot.forEach(doc => {
            chatRooms.push({chatRoomId: doc.id, ...doc.data()});
        });
        snapshot2.forEach(doc => {
            chatRooms.push({chatRoomId: doc.id, ...doc.data()});
        });
        res.status(200).send(chatRooms);
    } catch (error) {
        return res.status(400).send("An Error Occured" + error);
    }
});

// // Get message stream where message.chatRoomId == chatRoomId
// getRoutes.get('/messages/:chatRoomId', async (req, res) => {
//     try {
//         db.collection('messages').where('chatRoomId', '==', req.params.chatRoomId).onSnapshot((snapshot) => {
//             snapshot.docChanges().forEach(change => {
//                 if (change.type === 'added') {
//                     const message = { messageId: change.doc.id, ...change.doc.data() };
//                     res.write(JSON.stringify(message) + '\n');
//                 }
//             });
//         });
        
//         // Complete the response after sending initial messages
//         res.status(200).end();
//     } catch (error) {
//         return res.status(400).send("An Error Occurred: " + error);
//     }
// });


// Get message stream where message.chatRoomId == chatRoomId
getRoutes.get('/messages/:chatRoomId', async (req, res) => {
    try {
        db.collection('messages').where('chatRoomId', '==', req.params.chatRoomId).onSnapshot((snapshot) => {
            const messages: FirebaseFirestore.DocumentData[] = [];
            snapshot.forEach(doc => {
                messages.push({messageId: doc.id, ...doc.data()});
            });
            res.status(200).send(messages);
        });
    } catch (error) {
        return res.status(400).send("An Error Occured" + error);
    }
});




export default getRoutes