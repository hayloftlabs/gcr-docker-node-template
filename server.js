if (process.env.NODE_ENV !== 'production') {
  require('dotenv').config();
}

const path = require('path');
const Fastify = require('fastify');
const fastifyStatic = require('@fastify/static');

const app = Fastify({ logger: true });

app.register(fastifyStatic, {
  root: path.join(__dirname, 'public'),
  prefix: '/',
  index: ['index.html']
});

app.get('/healthz', async () => ({ status: 'ok' }));

app.listen({ port: process.env.APP_PORT || 8080, host: '0.0.0.0' });
