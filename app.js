import Fastify from 'fastify';
import dotenv from 'dotenv';
import { auth } from './middleware/auth.js';
import ratesRoutes from './routes/rates.js';

dotenv.config();

const app = Fastify({ logger: true });

app.addHook('preHandler', auth);

app.register(ratesRoutes);

app.listen({ port: process.env.PORT });