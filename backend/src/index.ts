import express, { Express, Request, Response } from 'express';
import dotenv from 'dotenv';
import { db } from './firebase';
import postRoutes from './post';
import getRoutes from './get';
import putRoutes from './put';
import deleteRoutes from './delete';
dotenv.config();

const app: Express = express();
const port = process.env.PORT;


app.get('/', (req: Request, res: Response) => {
  res.send('Express + TypeScdksript Server');
});

app.use('/post', postRoutes)
app.use('/get', getRoutes)
app.use('/put', putRoutes)
app.use('/delete', deleteRoutes)

app.listen(port, () => {
  console.log(`⚡️[server]: Server is running at http://localhost:${port}`);
});