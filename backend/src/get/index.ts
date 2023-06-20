import express from "express";

const getRoutes = express()
getRoutes.use(express.json())

// Place Routes Here
// getRoutes.get("/", (req, res) => {
//   res.send("Hello New World!");
// });

export default getRoutes