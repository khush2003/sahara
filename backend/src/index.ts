import express, {Request,Response,Application} from 'express';

const app:Application = express();
const PORT = process.env.PORT || 8000;
import getRoutes from './get/index';
import postRoutes from './post/index';
import deleteRoutes from './delete/index';
import putRoutes from './put/index';


app.use(express.json());


app.get("/", (req:Request, res:Response) => {
    res.send("Hello Typescript with Node.js!")
  });

app.use("/get", getRoutes);
app.use("/post", postRoutes);
app.use("/delete", deleteRoutes);
app.use("/put", putRoutes);

app.listen(PORT, ():void => {
console.log(`Server Running here 👉 https://localhost:${PORT}`);
});
