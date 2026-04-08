# Clean Folder Structure (Phase 1)

This repository now follows a clean-layer baseline without breaking existing imports.

## Frontend (`lib/src`)

- `core/` → global utilities, services, guards
- `features/` → feature-first modules (admin, doctor, patient, dispenser, lab_test, auth)
- `shared/` → reusable widgets/models/helpers across features

Current compatibility wrappers:

- `core/guards/auth_guards.dart`
- `core/services/services.dart`
- `core/utils/utils.dart`

## Backend (`backend/backend_server/lib/src`)

- `core/` → cross-cutting backend concerns
- `features/` → per-feature endpoint organization
- `shared/` → shared backend code across features

Current feature endpoint mapping:

- `features/admin/presentation/endpoints/*`
- `features/auth/presentation/endpoints/*`
- `features/dispenser/presentation/endpoints/*`
- `features/doctor/presentation/endpoints/*`
- `features/lab/presentation/endpoints/*`
- `features/notifications/presentation/endpoints/*`
- `features/password/presentation/endpoints/*`
- `features/patient/presentation/endpoints/*`

These feature endpoint files currently export existing `src/endpoints/*` files to keep runtime behavior unchanged.

## Next migration steps (Phase 2)

1. Move implementation from `src/endpoints/*` into corresponding `features/*` files.
2. Keep `src/endpoints/*` as compatibility exports during migration.
3. Update imports in frontend pages to use `core/*` and `features/*` barrels.
4. Remove old flat files once all imports are migrated.
