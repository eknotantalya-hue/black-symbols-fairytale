FROM node:22-slim

RUN apt-get update && apt-get install -y \
    git python3 make g++ curl rsync ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# ВАЖНО: позже лучше закрепить конкретную версию вместо latest
RUN npm install -g openclaw@latest

EXPOSE 18789

RUN mkdir -p /root/.openclaw /root/.openclaw/memory /root/.openclaw/logs

COPY openclaw.json /root/.openclaw/openclaw.json
COPY agents /root/.openclaw/agents/
COPY workspace /app/workspace
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
