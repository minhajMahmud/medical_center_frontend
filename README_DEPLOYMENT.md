# NSTU Medical Center — Deployment & Operations README

A complete guide for project structure, environment setup, web deployment (Vercel), backend deployment (Railway), and Android APK release.

---

## 1) Project Overview

NSTU Medical Center is a Flutter-based multi-platform frontend connected to a Serverpod backend.

- **Frontend:** Flutter (Web + Android)
- **Backend:** Serverpod (Dart)
- **Database:** PostgreSQL
- **Hosting:**
  - **Frontend Web:** Vercel
  - **Backend API:** Railway

---

## 2) Repository Structure

```text
frontend/
├─ lib/                         # Main Flutter app source
├─ packages/
│  └─ backend_client/           # Generated/Shared Serverpod API client
├─ android/                     # Android project config and Gradle
├─ ios/                         # iOS project
├─ web/                         # Flutter web wrapper assets
├─ assets/                      # Fonts/images/static assets
├─ test/                        # Flutter tests
├─ pubspec.yaml                 # Flutter dependencies
├─ vercel.json                  # Vercel web build config
├─ README.md                    # General project readme
└─ README_DEPLOYMENT.md         # This deployment guide
```

---

## 3) Backend URL Configuration (Critical)

Frontend reads backend URL from compile-time define:

- `SERVERPOD_URL`

Current production-safe default in client:

- `https://medicalcenterbackend-production.up.railway.app/`

> For production APK/web builds, always ensure backend URL points to Railway (HTTPS + trailing slash).

---

## 4) Local Development Setup

### Prerequisites

- Flutter SDK (stable)
- Dart SDK
- Java 17 or 21 (recommended for Android builds)
- Android SDK + platform tools

### Install dependencies

```bash
flutter pub get
```

### Run web locally (point to local backend)

```bash
flutter run -d chrome --dart-define=SERVERPOD_URL=http://localhost:8080/
```

### Run android locally

```bash
flutter run -d android --dart-define=SERVERPOD_URL=http://<your-lan-ip>:8080/
```

> Do not use `localhost` on a physical Android phone for local backend access.

---

## 5) Web Deployment (Vercel)

### Build command concept

Vercel should build with:

- `flutter pub get`
- `flutter build web --release --dart-define=SERVERPOD_URL=https://<railway-backend>/`

### Output directory

- `build/web`

### SPA rewrite

Ensure rewrite to `index.html` for route handling.

---

## 6) Backend Deployment (Railway)

For backend service, set required variables in Railway **service variables**:

- `DATABASE_URL` (if used by your runtime)
- `SERVERPOD_PASSWORD_database`
- `RESEND_API_KEY`
- `ALLOW_CONSOLE_OTP_FALLBACK=true` (temporary debug only)

Recommended explicit DB mapping vars (if your `production.yaml` uses them):

- `DATABASE_HOST`
- `DATABASE_PORT`
- `DATABASE_NAME`
- `DATABASE_USER`

### Important for stability

- Database SSL should be enabled for Railway Postgres connections in production config.
- After adding/changing variables, always **redeploy/restart** service.

---

## 7) Android APK Build & Release

### Build release APK

```bash
flutter build apk --release --dart-define=SERVERPOD_URL=https://medicalcenterbackend-production.up.railway.app/
```

### Generated file

- `build/app/outputs/flutter-apk/app-release.apk`

### Install notes

- Uninstall old app if signature/version conflicts.
- Install the latest `app-release.apk`.

---

## 8) Known Build Compatibility Notes

- Use **JDK 17 or JDK 21** for Android build stability.
- JDK 25 may cause Gradle/Kotlin parsing/runtime issues in this toolchain.
- If plugin registration fails for JNI-related classes, keep dependency lock/override aligned with project-tested versions.

---

## 9) OTP/Login Troubleshooting

If login shows: **"Failed to send login OTP"**

Check backend first:

1. Railway logs during login request
2. Resend API key validity
3. Verified sender/domain in Resend
4. DB connectivity health (no connection reset errors)

If logs show database reset errors (`Connection reset by peer`), fix DB connection config/SSL before OTP testing.

---

## 10) Security Best Practices (Very Important)

Do **not** commit real secrets in `.env`.

Rotate and replace exposed keys immediately if leaked:

- Resend API key
- Cloudinary API secret
- Database password

Keep `.env.example` with placeholders only.

---

## 11) Suggested Release Checklist

- [ ] Backend healthy on Railway (logs clean)
- [ ] OTP provider configured and working
- [ ] Web build points to Railway URL
- [ ] Android release APK built with production URL
- [ ] Smoke test: login, dashboard, key API-backed screens
- [ ] Secrets rotated and secured

---

## 12) Maintainer Notes

When changing API base URL behavior, update both:

- `packages/backend_client/lib/backend_client.dart`
- Deployment docs (`README.md` / `README_DEPLOYMENT.md`)

This keeps APK and web deployments consistent across environments.
