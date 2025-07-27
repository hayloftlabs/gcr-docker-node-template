# Minimal Dockerfile for Node Cloud Run template
FROM node:20
WORKDIR /app
COPY package*.json ./
RUN npm install -g npm@11.5.1 \
    && npm install --omit=dev
COPY . .
USER node
EXPOSE 8080
CMD ["node", "server.js"]
