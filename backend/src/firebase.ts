import {initializeApp, cert, ServiceAccount} from 'firebase-admin/app';
import {getFirestore} from 'firebase-admin/firestore';
import {getAuth} from 'firebase-admin/auth';
import * as serviceAccount from './serviceAccountKey.json';

initializeApp({
    credential: cert(serviceAccount as ServiceAccount),
});


export const db = getFirestore();

