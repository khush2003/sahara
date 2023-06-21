"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const deleteRoutes = (0, express_1.default)();
deleteRoutes.use(express_1.default.json());
// Place Routes Here
exports.default = deleteRoutes;
