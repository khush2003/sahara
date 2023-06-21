"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const dotenv_1 = __importDefault(require("dotenv"));
const post_1 = __importDefault(require("./post"));
const get_1 = __importDefault(require("./get"));
const put_1 = __importDefault(require("./put"));
const delete_1 = __importDefault(require("./delete"));
dotenv_1.default.config();
const cors_1 = __importDefault(require("cors"));
const app = (0, express_1.default)();
const port = process.env.PORT;
app.use((0, cors_1.default)());
app.get('/', (req, res) => {
    res.send('Welcome to Sahara Donation App Backend!');
});
app.use('/post', post_1.default);
app.use('/get', get_1.default);
app.use('/put', put_1.default);
app.use('/delete', delete_1.default);
app.listen(port, () => {
    console.log(`⚡️[server]: Server is running at http://localhost:${port}`);
});
