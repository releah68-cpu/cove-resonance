FROM node:22-slim

WORKDIR /app

COPY package*.json ./
RUN npm ci --no-audit --no-fund

COPY tsconfig.json ./
COPY src ./src

RUN npm run build && npm prune --omit=dev

ENV NODE_ENV=production
EXPOSE 8787

CMD ["node", "dist/src/server.js"]
