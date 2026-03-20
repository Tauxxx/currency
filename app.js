import Fastify from 'fastify';
import dotenv from 'dotenv';
import { auth } from './middleware/auth.js';
import ratesRoutes from './routes/rates.js';
import currenciesRoutes from './routes/currencies.js';

dotenv.config();

const app = Fastify({ logger: true });

app.addHook('preHandler', auth);

app.register(ratesRoutes);
app.register(currenciesRoutes);

app.listen({ port: process.env.PORT });