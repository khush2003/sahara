import express, { Express, Request, Response } from 'express';
import { db } from './firebase';
import postRoutes from './post';
import getRoutes from './get';
import putRoutes from './put';
import deleteRoutes from './delete';

import WebSocket from 'ws';

import cors from 'cors';

const app: Express = express();
const port: number = 5000; //Put this in .env file when building code for production
const hostname = '127.0.0.1'; // Using this url for testing purposes (same as localhost), this supports android emulator when paired with 10.0.2.2
const webPort = 8080;

// Using the WebSocket library to create a WebSocket server
const wss = new WebSocket.Server({ port: webPort, host: hostname});

wss.on('connection', (ws: WebSocket) => {
  console.log('New WebSocket connection');

  ws.on('message', (message: string) => {
    const { chatRoomId } = JSON.parse(message);

    // Subscribe to real-time updates on the messages collection where chatRoomId matches
    const unsubscribe = db.collection('messages')
      .where('chatRoomId', '==', chatRoomId)
      .onSnapshot((snapshot: FirebaseFirestore.QuerySnapshot) => {
        const messages: FirebaseFirestore.DocumentData[] = [];
        snapshot.forEach((doc: FirebaseFirestore.DocumentSnapshot) => {
          messages.push({ messageId: doc.id, ...doc.data() });
        });

        // Send the updated messages to the client
        ws.send(JSON.stringify(messages));
      });

    ws.on('close', () => {
      console.log('WebSocket connection closed');
      // Unsubscribe from real-time updates when the WebSocket connection is closed
      unsubscribe();
    });
  });
});


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