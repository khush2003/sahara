"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var express_1 = require("express");
var dotenv_1 = require("dotenv");
var post_1 = require("./post");
var get_1 = require("./get");
var put_1 = require("./put");
var delete_1 = require("./delete");
dotenv_1.default.config();
var app = (0, express_1.default)();
var port = process.env.PORT;
app.get('/', function (req, res) {
    res.send('123 Express + TypeScript Server');
});
app.use('/post', post_1.default);
app.use('/get', get_1.default);
app.use('/put', put_1.default);
app.use('/delete', delete_1.default);
app.listen(port, function () {
    console.log("\u26A1\uFE0F[server]: Server is running at http://localhost:".concat(port));
});
