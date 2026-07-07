# 02. АРХИТЕКТУРА

Версия: 0.1
Статус: рабочая карта

---

## Главная схема

```text
Дед → Telegram → Гвидон → Workspace/GitHub → отчёт Деду
```

## GitHub

GitHub — источник истины для кода, документов, памяти, решений и отчётов.

## Render

Render — среда исполнения сервисов:

- black-symbols-gvidon;
- pay-blacksymbols;
- bs-configurator-api.

## Telegram

Telegram — шлюз общения. Он не является постоянной памятью.

## Workspace

Эталонная память:

```text
repo/workspace/
```

Рабочая память в контейнере:

```text
/root/.openclaw/workspace/
```

Нужно настроить синхронизацию repo/workspace → /root/.openclaw/workspace при запуске контейнера.

## Репозитории

- `black_symbols_state` — инфраструктурная память, задачи, расходы, подрядчики, будущий world.
- `black-symbols-fairytale` — агенты, Гвидон, workspace, Конституция.
- `bs_wallpaper` — визуализация фраз через SVG.
- `bs_individual_configurator` — индивидуальный конфигуратор.
- `pay-blacksymbols` — платежный шлюз Tilda ↔ Param. Не трогать без разрешения.

## Внешние системы

- Tilda;
- Param;
- Paraşüt;
- GoDaddy;
- Microsoft 365;
- SendGrid;
- Twilio;
- Google Sheets/PIM;
- Google Cloud Storage;
- Telegram;
- Render;
- GitHub.

## Критические файлы

`openclaw.json` и `render.yaml` не менять без разрешения Деда.
