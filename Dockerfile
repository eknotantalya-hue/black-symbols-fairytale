FROM node:22-slim

# Устанавливаем зависимости
RUN apt-get update && apt-get install -y git python3 make g++ curl && rm -rf /var/lib/apt/lists/*

# Устанавливаем OpenClaw глобально
RUN npm install -g openclaw@latest

# Указываем порт, который будет слушать сервер
EXPOSE 18789

# Создаем директорию для конфигурации OpenClaw внутри контейнера
RUN mkdir -p /root/.openclaw

# Копируем твои локальные настройки в системную папку контейнера
COPY openclaw.json /root/.openclaw/openclaw.json
COPY agents /root/.openclaw/agents/

# ЗАПУСКАЕМ ШЛЮЗ (GATEWAY) И УКАЗЫВАЕМ ПРАВИЛЬНЫЙ АДРЕС
CMD ["openclaw", "gateway", "--bind", "lan", "--port", "18789", "--allow-unconfigured"]
