import express from "express";

const putRoutes = express()
putRoutes.use(express.json())

// Place Routes Here
// getRoutes.get("/", (req, res) => {
//   res.send("Hello New World!");
// });

export default putRoutes