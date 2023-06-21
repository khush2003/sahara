"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.db = void 0;
var app_1 = require("firebase-admin/app");
var firestore_1 = require("firebase-admin/firestore");
var serviceAccount = require("./serviceAccountKey.json");
(0, app_1.initializeApp)({
    credential: (0, app_1.cert)(serviceAccount),
});
exports.db = (0, firestore_1.getFirestore)();
