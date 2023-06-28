import express from "express";
import { db } from "../firebase";
const putRoutes = express();
putRoutes.use(express.json());

// Place Routes Here
putRoutes.post("/user", async (req, res) => {
  const user = await db.collection("users").add({
    hello: "world",
  });
  res.send(user);
});

putRoutes.put("/users/:id", async (req, res) => {
    const userId = req.params.id;
    const userData = req.body;
    try {
      await db.collection('users').doc(userId).set(userData, { merge: true });
      res.status(200).send("User updated successfully");
    } catch (error) {
      console.error("Error updating user:", error);
      res.status(500).send("Error updating user");
    }
  });

  putRoutes.put("/allUserName/:id", async (req, res) => {
    const userId = req.params.id; 
    const userName = req.body.userName;
    try {
      await db.collection('users').doc(userId).update({userName: userName});
      // Write a firebase call to update all donationItem's authorName where authorId = userId
      await db.collection('donationItems').where('authorId', '==', userId).get().then((querySnapshot) => {
        querySnapshot.forEach((doc) => {
          doc.ref.update({authorName: userName});
        });
      });
      // Write a firebase call to update all reviews' reviewerName where reviewerId = userId
      await db.collection('reviews').where('reviewerId', '==', userId).get().then((querySnapshot) => {
        querySnapshot.forEach((doc) => {
          doc.ref.update({reviewerName: userName});
        });
      });
      // TODO: Same for ImageURL
      res.status(200).send("User updated successfully");
    } catch (error) {
      console.error("Error updating user:", error);
      res.status(500).send("Error updating user");
    }
  });

  

export default putRoutes;
