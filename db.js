import { Firestore } from '@google-cloud/firestore';
import dotenv from 'dotenv';

dotenv.config();

const firestore = new Firestore({
  projectId: process.env.PROJECT_ID,
  databaseId: 'currency-firestore'
});
export const db = firestore;