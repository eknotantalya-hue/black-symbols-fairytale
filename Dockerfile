FROM node:20-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git

RUN npm install -g openclaw@2026.4.2

COPY . .

RUN openclaw onboard --non-interactive --provider google \
  --model gemini-3-flash-preview \
  --telegram-token ${TELEGRAM_TOKEN}

CMD ["openclaw", "gateway", "--bind", "0.0.0.0:18789"]
