# stage only to be used as builder
FROM node:22-bookworm AS builder

WORKDIR /app

COPY ./package*.json ./
RUN npm install
COPY ./ ./

# final stage where the applicaiton will be running
FROM node:22-slim

WORKDIR /app

RUN addgroup --gid 1001 node || true && \
    adduser --uid 1001 --ingroup node --disabled-password node || true \
    chown -R node:node /app
USER node
COPY --from=builder --chown=node:node /app ./

EXPOSE 3000
CMD ["node", "./src/index.js"]