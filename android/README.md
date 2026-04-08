# NSTU Medical Center — Android App

This folder contains Android platform configuration for the Flutter mobile app at the repository root.

## Overview

- Flutter app source: repository root (`lib/`, `pubspec.yaml`)
- Android platform module: `android/`
- Backend API client: `packages/backend_client`

## Requirements

- Flutter SDK (stable)
- Android Studio (or Android SDK + platform tools)
- Java 17
- Android device or emulator

## Quick start

From repository root:

1. Get dependencies:

`flutter pub get`

2. Run on Android:

`flutter run -d android`

If multiple devices are connected, check IDs:

`flutter devices`

Then run with a specific device ID:

`flutter run -d <device-id>`

## Backend API configuration

The app initializes the Serverpod client via `packages/backend_client/lib/backend_client.dart`.

Default URL:

- `http://localhost:8080/`

Override with dart-define (recommended for real devices):

`flutter run -d android --dart-define=SERVERPOD_URL=http://<your-local-ip>:8080/`

Example:

`flutter run -d android --dart-define=SERVERPOD_URL=http://192.168.0.15:8080/`

### Important notes

- Android emulator can often use host machine via `10.0.2.2`.
- Physical devices cannot use `localhost` to reach your PC backend.

## Build APK

From repository root:

`flutter build apk --release`

Output:

- `build/app/outputs/flutter-apk/app-release.apk`

## Build App Bundle (Play Store)

From repository root:

`flutter build appbundle --release`

Output:

- `build/app/outputs/bundle/release/app-release.aab`

## Signing

`android/app/build.gradle.kts` is configured to:

- use release signing when `android/key.properties` exists
- otherwise fall back to debug signing

For release signing, create:

- `android/key.properties`

with standard fields:

- `storeFile`
- `storePassword`
- `keyAlias`
- `keyPassword`

## Common issues

- **Port/backend unreachable on phone**: use your computer LAN IP in `SERVERPOD_URL`.
- **Gradle/JDK mismatch**: ensure Java 17 is active.
- **Build fails after dependency changes**:
  - run `flutter clean`
  - run `flutter pub get`
  - run `flutter run -d android`
