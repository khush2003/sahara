import express, { Express, Request, Response } from 'express';
import dotenv from 'dotenv';
import { db } from './firebase';
import postRoutes from './post';
import getRoutes from './get';
import putRoutes from './put';
import deleteRoutes from './delete';
import { DonationItem } from '../types';
dotenv.config();
import cors from 'cors';

const app: Express = express();
const port: number = parseInt(process.env.PORT ?? '5000') as number;
const hostname = '127.0.0.1';

app.use(cors());


app.get('/', (req: Request, res: Response) => {
  res.send('Welcome to Sahara Donation App Backend!');
});


app.use('/post', postRoutes)
app.use('/get', getRoutes)
app.use('/put', putRoutes)
app.use('/delete', deleteRoutes)

app.listen(port, hostname, () => {
  console.log(`⚡️[server]: Server is running at http://localhost:${port}`);
});