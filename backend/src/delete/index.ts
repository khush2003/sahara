import express from "express";

const deleteRoutes = express()
deleteRoutes.use(express.json())

// Place Routes Here
// getRoutes.get("/", (req, res) => {
//   res.send("Hello New World!");
// });

export default deleteRoutes