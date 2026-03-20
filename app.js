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

const port = parseInt(process.env.PORT) || 8080;
app.listen({ port, host: '0.0.0.0' });
