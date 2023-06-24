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
  

export default putRoutes;
