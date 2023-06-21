import express from "express";
import { db } from "../firebase";
const deleteRoutes = express()
deleteRoutes.use(express.json())

// Place Routes Here


export default deleteRoutes