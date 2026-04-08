# NSTU Medical Center

A multi-platform medical center management system built with **Flutter** (Web + Android) and a **Serverpod** backend.

## Project Structure

- `backend/backend_server` — Serverpod backend API
- `packages/backend_client` — Shared generated API client (used by all frontends)
- `web_app` — Flutter Web frontend
- Root Flutter app (`lib/`, `android/`) — Flutter mobile app (Android)

## Features

- Role-based access: **Patient, Doctor, Admin, Lab, Dispenser**
- Authentication and protected routes
- Appointment and prescription management
- Lab report upload/view workflows
- Inventory and medicine dispensing flows
- Notifications and operational audit logs

## Tech Stack

- **Frontend:** Flutter
- **Backend:** Serverpod (Dart)
- **Database:** PostgreSQL
- **Cache/Support services:** Redis
- **Targets:** Web and Android

## Prerequisites

- Flutter SDK (stable)
- Dart SDK
- Docker Desktop (for PostgreSQL/Redis services)
- Java 17 (for Android builds)

---

## Backend Setup (Serverpod)

From repository root:

`cd backend/backend_server`

`dart pub get`

`docker compose up --build --detach`

`dart bin/main.dart --apply-migrations`

`dart bin/main.dart`

Default backend URL:

- `http://localhost:8080/`

---

## Web App Setup (`web_app`)

From repository root:

`cd web_app`

`flutter pub get`

`flutter run -d chrome --dart-define=SERVERPOD_URL=http://localhost:8080/`

Production build:

`flutter build web --release --dart-define=SERVERPOD_URL=https://your-api-url/`

Build output:

- `web_app/build/web`

---

## Android App Setup (Root Flutter App)

From repository root:

`flutter pub get`

`flutter run -d android --dart-define=SERVERPOD_URL=http://<your-local-ip>:8080/`

> For physical Android devices, do **not** use `localhost`; use your PC's LAN IP.

Build APK:

`flutter build apk --release`

Build App Bundle:

`flutter build appbundle --release`

---

## Backend URL Configuration

Clients support backend override via:

- `--dart-define=SERVERPOD_URL=<url>`

Examples:

- Local: `http://localhost:8080/`
- LAN (mobile testing): `http://192.168.x.x:8080/`
- Production: `https://api.example.com/`

---

## Troubleshooting

- **Port 8080/8081/8082 already in use:** stop previous backend process, then rerun.
- **Push rejected (non-fast-forward):** fetch + rebase, then push.
- **Cannot connect to backend:** verify `SERVERPOD_URL` and network route.
- **Generated model mismatch errors:** regenerate Serverpod code and run dependency sync again.

---

## License

Licensed under the terms defined in `LICENSE`.
