import Fastify from 'fastify';
import dotenv from 'dotenv';
import { auth } from './middleware/auth.js';
import ratesRoutes from './routes/rates.js';
import currenciesRoutes from './routes/currencies.js';
import healthRoutes from './routes/health.js';
import cors from '@fastify/cors';


dotenv.config();

const app = Fastify({ logger: true });

app.addHook('preHandler', auth);

app.register(ratesRoutes);
app.register(currenciesRoutes);
app.register(healthRoutes);

await app.register(cors, {
  origin: true,
});
app.listen({ port: process.env.PORT, host: '0.0.0.0' });