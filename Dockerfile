FROM node:20-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git python3 make g++

RUN npm install -g openclaw

COPY . .

EXPOSE 18789

CMD ["openclaw", "gateway", "--bind", "0.0.0.0:18789"]
