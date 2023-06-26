"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const firebase_1 = require("../firebase");
const postRoutes = (0, express_1.default)();
postRoutes.use(express_1.default.json());
postRoutes.post("/donationItem", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const donationItem = yield firebase_1.db.collection('donationItems').add(req.body);
    res.status(200).send(donationItem);
}));
postRoutes.post("/users/:id", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const userId = req.params.id;
    const user = yield firebase_1.db.collection('users').doc(userId).set(req.body);
    res.status(200).send(userId);
}));
postRoutes.post("/review", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const user = yield firebase_1.db.collection('reviews').add(req.body);
    res.status(200).send(user);
}));
exports.default = postRoutes;
