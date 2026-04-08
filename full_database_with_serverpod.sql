-- =====================================================================
-- NSTU Medical Center - Full Fresh Install Database
-- Includes:
--   1) Serverpod core + auth tables
--   2) Application domain tables (users, prescriptions, lab, inventory, etc.)
-- =====================================================================

BEGIN;

--
-- Function: gen_random_uuid_v7()
-- Source: https://gist.github.com/kjmph/5bd772b2c2df145aa645b837da7eca74
-- License: MIT (copyright notice included on the generator source code).
--
create or replace function gen_random_uuid_v7()
returns uuid
as $$
begin
  return encode(
    set_bit(
      set_bit(
        overlay(uuid_send(gen_random_uuid())
                placing substring(int8send(floor(extract(epoch from clock_timestamp()) * 1000)::bigint) from 3)
                from 1 for 6
        ),
        52, 1
      ),
      53, 1
    ),
    'hex')::uuid;
end
$$
language plpgsql
volatile;

-- =========================
-- Serverpod core tables
-- =========================
CREATE TABLE "serverpod_cloud_storage" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "addedTime" timestamp without time zone NOT NULL,
    "expiration" timestamp without time zone,
    "byteData" bytea NOT NULL,
    "verified" boolean NOT NULL
);
CREATE UNIQUE INDEX "serverpod_cloud_storage_path_idx" ON "serverpod_cloud_storage" USING btree ("storageId", "path");
CREATE INDEX "serverpod_cloud_storage_expiration" ON "serverpod_cloud_storage" USING btree ("expiration");

CREATE TABLE "serverpod_cloud_storage_direct_upload" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL,
    "authKey" text NOT NULL
);
CREATE UNIQUE INDEX "serverpod_cloud_storage_direct_upload_storage_path" ON "serverpod_cloud_storage_direct_upload" USING btree ("storageId", "path");

CREATE TABLE "serverpod_future_call" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "serializedObject" text,
    "serverId" text NOT NULL,
    "identifier" text
);
CREATE INDEX "serverpod_future_call_time_idx" ON "serverpod_future_call" USING btree ("time");
CREATE INDEX "serverpod_future_call_serverId_idx" ON "serverpod_future_call" USING btree ("serverId");
CREATE INDEX "serverpod_future_call_identifier_idx" ON "serverpod_future_call" USING btree ("identifier");

CREATE TABLE "serverpod_health_connection_info" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "active" bigint NOT NULL,
    "closing" bigint NOT NULL,
    "idle" bigint NOT NULL,
    "granularity" bigint NOT NULL
);
CREATE UNIQUE INDEX "serverpod_health_connection_info_timestamp_idx" ON "serverpod_health_connection_info" USING btree ("timestamp", "serverId", "granularity");

CREATE TABLE "serverpod_health_metric" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isHealthy" boolean NOT NULL,
    "value" double precision NOT NULL,
    "granularity" bigint NOT NULL
);
CREATE UNIQUE INDEX "serverpod_health_metric_timestamp_idx" ON "serverpod_health_metric" USING btree ("timestamp", "serverId", "name", "granularity");

CREATE TABLE "serverpod_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "reference" text,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "logLevel" bigint NOT NULL,
    "message" text NOT NULL,
    "error" text,
    "stackTrace" text,
    "order" bigint NOT NULL
);
CREATE INDEX "serverpod_log_sessionLogId_idx" ON "serverpod_log" USING btree ("sessionLogId");

CREATE TABLE "serverpod_message_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "serverId" text NOT NULL,
    "messageId" bigint NOT NULL,
    "endpoint" text NOT NULL,
    "messageName" text NOT NULL,
    "duration" double precision NOT NULL,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

CREATE TABLE "serverpod_method" (
    "id" bigserial PRIMARY KEY,
    "endpoint" text NOT NULL,
    "method" text NOT NULL
);
CREATE UNIQUE INDEX "serverpod_method_endpoint_method_idx" ON "serverpod_method" USING btree ("endpoint", "method");

CREATE TABLE "serverpod_migrations" (
    "id" bigserial PRIMARY KEY,
    "module" text NOT NULL,
    "version" text NOT NULL,
    "timestamp" timestamp without time zone
);
CREATE UNIQUE INDEX "serverpod_migrations_ids" ON "serverpod_migrations" USING btree ("module");

CREATE TABLE "serverpod_query_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "query" text NOT NULL,
    "duration" double precision NOT NULL,
    "numRows" bigint,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);
CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON "serverpod_query_log" USING btree ("sessionLogId");

CREATE TABLE "serverpod_readwrite_test" (
    "id" bigserial PRIMARY KEY,
    "number" bigint NOT NULL
);

CREATE TABLE "serverpod_runtime_settings" (
    "id" bigserial PRIMARY KEY,
    "logSettings" json NOT NULL,
    "logSettingsOverrides" json NOT NULL,
    "logServiceCalls" boolean NOT NULL,
    "logMalformedCalls" boolean NOT NULL
);

CREATE TABLE "serverpod_session_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "module" text,
    "endpoint" text,
    "method" text,
    "duration" double precision,
    "numQueries" bigint,
    "slow" boolean,
    "error" text,
    "stackTrace" text,
    "authenticatedUserId" bigint,
    "userId" text,
    "isOpen" boolean,
    "touched" timestamp without time zone NOT NULL
);
CREATE INDEX "serverpod_session_log_serverid_idx" ON "serverpod_session_log" USING btree ("serverId");
CREATE INDEX "serverpod_session_log_touched_idx" ON "serverpod_session_log" USING btree ("touched");
CREATE INDEX "serverpod_session_log_isopen_idx" ON "serverpod_session_log" USING btree ("isOpen");

-- =========================
-- Serverpod auth tables
-- =========================
CREATE TABLE "serverpod_auth_idp_apple_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "userIdentifier" text NOT NULL,
    "refreshToken" text NOT NULL,
    "refreshTokenRequestedWithBundleIdentifier" boolean NOT NULL,
    "lastRefreshedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "authUserId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "email" text,
    "isEmailVerified" boolean,
    "isPrivateEmail" boolean,
    "firstName" text,
    "lastName" text
);
CREATE UNIQUE INDEX "serverpod_auth_apple_account_identifier" ON "serverpod_auth_idp_apple_account" USING btree ("userIdentifier");

CREATE TABLE "serverpod_auth_idp_email_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "email" text NOT NULL,
    "passwordHash" text NOT NULL
);
CREATE UNIQUE INDEX "serverpod_auth_idp_email_account_email" ON "serverpod_auth_idp_email_account" USING btree ("email");

CREATE TABLE "serverpod_auth_idp_email_account_password_reset_request" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "emailAccountId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "challengeId" uuid NOT NULL,
    "setPasswordChallengeId" uuid
);

CREATE TABLE "serverpod_auth_idp_email_account_request" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "email" text NOT NULL,
    "challengeId" uuid NOT NULL,
    "createAccountChallengeId" uuid
);
CREATE UNIQUE INDEX "serverpod_auth_idp_email_account_request_email" ON "serverpod_auth_idp_email_account_request" USING btree ("email");

CREATE TABLE "serverpod_auth_idp_google_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "created" timestamp without time zone NOT NULL,
    "email" text NOT NULL,
    "userIdentifier" text NOT NULL
);
CREATE UNIQUE INDEX "serverpod_auth_google_account_user_identifier" ON "serverpod_auth_idp_google_account" USING btree ("userIdentifier");

CREATE TABLE "serverpod_auth_idp_passkey_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "keyId" bytea NOT NULL,
    "keyIdBase64" text NOT NULL,
    "clientDataJSON" bytea NOT NULL,
    "attestationObject" bytea NOT NULL,
    "originalChallenge" bytea NOT NULL
);
CREATE UNIQUE INDEX "serverpod_auth_idp_passkey_account_key_id_base64" ON "serverpod_auth_idp_passkey_account" USING btree ("keyIdBase64");

CREATE TABLE "serverpod_auth_idp_passkey_challenge" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "createdAt" timestamp without time zone NOT NULL,
    "challenge" bytea NOT NULL
);

CREATE TABLE "serverpod_auth_idp_rate_limited_request_attempt" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "domain" text NOT NULL,
    "source" text NOT NULL,
    "nonce" text NOT NULL,
    "ipAddress" text,
    "attemptedAt" timestamp without time zone NOT NULL,
    "extraData" json
);
CREATE INDEX "serverpod_auth_idp_rate_limited_request_attempt_domain" ON "serverpod_auth_idp_rate_limited_request_attempt" USING btree ("domain");
CREATE INDEX "serverpod_auth_idp_rate_limited_request_attempt_source" ON "serverpod_auth_idp_rate_limited_request_attempt" USING btree ("source");
CREATE INDEX "serverpod_auth_idp_rate_limited_request_attempt_nonce" ON "serverpod_auth_idp_rate_limited_request_attempt" USING btree ("nonce");

CREATE TABLE "serverpod_auth_idp_secret_challenge" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "challengeCodeHash" text NOT NULL
);

CREATE TABLE "serverpod_auth_core_jwt_refresh_token" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "scopeNames" json NOT NULL,
    "extraClaims" text,
    "method" text NOT NULL,
    "fixedSecret" bytea NOT NULL,
    "rotatingSecretHash" text NOT NULL,
    "lastUpdatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX "serverpod_auth_core_jwt_refresh_token_last_updated_at" ON "serverpod_auth_core_jwt_refresh_token" USING btree ("lastUpdatedAt");

CREATE TABLE "serverpod_auth_core_profile" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "userName" text,
    "fullName" text,
    "email" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "imageId" uuid
);
CREATE UNIQUE INDEX "serverpod_auth_profile_user_profile_email_auth_user_id" ON "serverpod_auth_core_profile" USING btree ("authUserId");

CREATE TABLE "serverpod_auth_core_profile_image" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "userProfileId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "url" text NOT NULL
);

CREATE TABLE "serverpod_auth_core_session" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "scopeNames" json NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lastUsedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expiresAt" timestamp without time zone,
    "expireAfterUnusedFor" bigint,
    "sessionKeyHash" bytea NOT NULL,
    "sessionKeySalt" bytea NOT NULL,
    "method" text NOT NULL
);

CREATE TABLE "serverpod_auth_core_user" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "createdAt" timestamp without time zone NOT NULL,
    "scopeNames" json NOT NULL,
    "blocked" boolean NOT NULL
);

-- Foreign keys for Serverpod tables
ALTER TABLE ONLY "serverpod_log"
    ADD CONSTRAINT "serverpod_log_fk_0"
    FOREIGN KEY("sessionLogId") REFERENCES "serverpod_session_log"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE ONLY "serverpod_message_log"
    ADD CONSTRAINT "serverpod_message_log_fk_0"
    FOREIGN KEY("sessionLogId") REFERENCES "serverpod_session_log"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE ONLY "serverpod_query_log"
    ADD CONSTRAINT "serverpod_query_log_fk_0"
    FOREIGN KEY("sessionLogId") REFERENCES "serverpod_session_log"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE ONLY "serverpod_auth_idp_apple_account"
    ADD CONSTRAINT "serverpod_auth_idp_apple_account_fk_0"
    FOREIGN KEY("authUserId") REFERENCES "serverpod_auth_core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE ONLY "serverpod_auth_idp_email_account"
    ADD CONSTRAINT "serverpod_auth_idp_email_account_fk_0"
    FOREIGN KEY("authUserId") REFERENCES "serverpod_auth_core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE ONLY "serverpod_auth_idp_email_account_password_reset_request"
    ADD CONSTRAINT "serverpod_auth_idp_email_account_password_reset_request_fk_0"
    FOREIGN KEY("emailAccountId") REFERENCES "serverpod_auth_idp_email_account"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE ONLY "serverpod_auth_idp_email_account_password_reset_request"
    ADD CONSTRAINT "serverpod_auth_idp_email_account_password_reset_request_fk_1"
    FOREIGN KEY("challengeId") REFERENCES "serverpod_auth_idp_secret_challenge"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE ONLY "serverpod_auth_idp_email_account_password_reset_request"
    ADD CONSTRAINT "serverpod_auth_idp_email_account_password_reset_request_fk_2"
    FOREIGN KEY("setPasswordChallengeId") REFERENCES "serverpod_auth_idp_secret_challenge"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE ONLY "serverpod_auth_idp_email_account_request"
    ADD CONSTRAINT "serverpod_auth_idp_email_account_request_fk_0"
    FOREIGN KEY("challengeId") REFERENCES "serverpod_auth_idp_secret_challenge"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE ONLY "serverpod_auth_idp_email_account_request"
    ADD CONSTRAINT "serverpod_auth_idp_email_account_request_fk_1"
    FOREIGN KEY("createAccountChallengeId") REFERENCES "serverpod_auth_idp_secret_challenge"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE ONLY "serverpod_auth_idp_google_account"
    ADD CONSTRAINT "serverpod_auth_idp_google_account_fk_0"
    FOREIGN KEY("authUserId") REFERENCES "serverpod_auth_core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE ONLY "serverpod_auth_idp_passkey_account"
    ADD CONSTRAINT "serverpod_auth_idp_passkey_account_fk_0"
    FOREIGN KEY("authUserId") REFERENCES "serverpod_auth_core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE ONLY "serverpod_auth_core_jwt_refresh_token"
    ADD CONSTRAINT "serverpod_auth_core_jwt_refresh_token_fk_0"
    FOREIGN KEY("authUserId") REFERENCES "serverpod_auth_core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE ONLY "serverpod_auth_core_profile"
    ADD CONSTRAINT "serverpod_auth_core_profile_fk_0"
    FOREIGN KEY("authUserId") REFERENCES "serverpod_auth_core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE ONLY "serverpod_auth_core_profile"
    ADD CONSTRAINT "serverpod_auth_core_profile_fk_1"
    FOREIGN KEY("imageId") REFERENCES "serverpod_auth_core_profile_image"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE ONLY "serverpod_auth_core_profile_image"
    ADD CONSTRAINT "serverpod_auth_core_profile_image_fk_0"
    FOREIGN KEY("userProfileId") REFERENCES "serverpod_auth_core_profile"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE ONLY "serverpod_auth_core_session"
    ADD CONSTRAINT "serverpod_auth_core_session_fk_0"
    FOREIGN KEY("authUserId") REFERENCES "serverpod_auth_core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- Seed migration versions
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('backend', '20260316120000000', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260316120000000', "timestamp" = now();

INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20251208110420531-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110420531-v3-0-0', "timestamp" = now();

INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20251208110412389-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110412389-v3-0-0', "timestamp" = now();

COMMIT;


BEGIN;

-- =========================
-- Application schema
-- =========================
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'user_role') THEN
    CREATE TYPE user_role AS ENUM (
      'student',
      'teacher',
      'staff',
      'outside',
      'doctor',
      'dispenser',
      'labstaff',
      'admin',
      'lab'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'roster_user_role') THEN
    CREATE TYPE roster_user_role AS ENUM ('DOCTOR','NURSE','STAFF');
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'shift_type') THEN
    CREATE TYPE shift_type AS ENUM ('MORNING','AFTERNOON','NIGHT');
  END IF;
END
$$;

CREATE TABLE IF NOT EXISTS users (
  user_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  password_hash TEXT NOT NULL,
  phone TEXT UNIQUE,
  role user_role NOT NULL,
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  profile_picture_url TEXT,
  email_otp_verified BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS patient_profiles (
  user_id INT PRIMARY KEY REFERENCES users(user_id) ON DELETE CASCADE,
  blood_group TEXT,
  date_of_birth DATE,
  gender TEXT
);

CREATE TABLE IF NOT EXISTS staff_profiles (
  user_id INT PRIMARY KEY REFERENCES users(user_id) ON DELETE CASCADE,
  designation TEXT,
  qualification TEXT,
  signature_url TEXT
);

CREATE TABLE IF NOT EXISTS notifications (
  notification_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  message TEXT NOT NULL,
  is_read BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS audit_log (
  audit_id SERIAL PRIMARY KEY,
  user_id TEXT NOT NULL,
  action TEXT NOT NULL,
  target_id TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS inventory_category (
  category_id SERIAL PRIMARY KEY,
  category_name TEXT NOT NULL UNIQUE,
  description TEXT
);

CREATE TABLE IF NOT EXISTS inventory_item (
  item_id SERIAL PRIMARY KEY,
  category_id INT NOT NULL REFERENCES inventory_category(category_id),
  item_name TEXT NOT NULL,
  unit TEXT,
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS inventory_stock (
  item_id INT PRIMARY KEY REFERENCES inventory_item(item_id) ON DELETE CASCADE,
  current_quantity INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS inventory_transaction (
  transaction_id SERIAL PRIMARY KEY,
  item_id INT NOT NULL REFERENCES inventory_item(item_id),
  transaction_type TEXT NOT NULL,
  quantity INT NOT NULL,
  reason TEXT,
  changed_by INT REFERENCES users(user_id),
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS inventory_audit_log (
  audit_id SERIAL PRIMARY KEY,
  item_id INT REFERENCES inventory_item(item_id),
  old_quantity INT,
  new_quantity INT,
  changed_by INT REFERENCES users(user_id),
  action TEXT,
  changed_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS lab_tests (
  test_id SERIAL PRIMARY KEY,
  test_name TEXT NOT NULL UNIQUE,
  description TEXT,
  student_fee NUMERIC(10,2) DEFAULT 0,
  teacher_fee NUMERIC(10,2) DEFAULT 0,
  outside_fee NUMERIC(10,2) DEFAULT 0,
  available BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS test_results (
  result_id SERIAL PRIMARY KEY,
  test_id INT REFERENCES lab_tests(test_id),
  patient_name TEXT,
  mobile_number TEXT,
  patient_type TEXT,
  is_uploaded BOOLEAN DEFAULT FALSE,
  attachment_path TEXT,
  submitted_at TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS prescriptions (
  prescription_id SERIAL PRIMARY KEY,
  patient_id INT NOT NULL REFERENCES users(user_id),
  doctor_id INT NOT NULL REFERENCES users(user_id),
  name TEXT,
  age INT,
  mobile_number TEXT,
  gender TEXT,
  prescription_date DATE NOT NULL DEFAULT CURRENT_DATE,
  cc TEXT,
  oe TEXT,
  bp TEXT,
  temperature TEXT,
  advice TEXT,
  test TEXT,
  next_visit TEXT,
  is_outside BOOLEAN DEFAULT FALSE,
  revised_from_id INT REFERENCES prescriptions(prescription_id),
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS prescribed_items (
  item_id SERIAL PRIMARY KEY,
  prescription_id INT NOT NULL REFERENCES prescriptions(prescription_id) ON DELETE CASCADE,
  medicine_name TEXT NOT NULL,
  dosage_times TEXT,
  meal_timing TEXT,
  duration INT,
  item_id_ref INT NULL REFERENCES inventory_item(item_id)
);

CREATE TABLE IF NOT EXISTS prescription_dispense (
  dispense_id SERIAL PRIMARY KEY,
  prescription_id INT NOT NULL REFERENCES prescriptions(prescription_id) ON DELETE CASCADE,
  dispenser_id INT REFERENCES users(user_id),
  status TEXT DEFAULT 'PENDING',
  dispensed_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS dispensed_items (
  dispensed_item_id SERIAL PRIMARY KEY,
  dispense_id INT NOT NULL REFERENCES prescription_dispense(dispense_id) ON DELETE CASCADE,
  item_id INT REFERENCES inventory_item(item_id),
  medicine_name TEXT,
  quantity INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS "UploadpatientR" (
  report_id SERIAL PRIMARY KEY,
  patient_id INT NOT NULL REFERENCES users(user_id),
  type TEXT NOT NULL,
  report_date DATE NOT NULL DEFAULT CURRENT_DATE,
  file_path TEXT NOT NULL,
  prescribed_doctor_id INT REFERENCES users(user_id),
  prescription_id INT REFERENCES prescriptions(prescription_id),
  uploaded_by INT REFERENCES users(user_id),
  reviewed BOOLEAN NOT NULL DEFAULT FALSE,
  doctor_notes TEXT,
  visible_to_patient BOOLEAN NOT NULL DEFAULT FALSE,
  review_action TEXT,
  reviewed_at TIMESTAMP,
  reviewed_by INT REFERENCES users(user_id),
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS appointment_requests (
  request_id SERIAL PRIMARY KEY,
  patient_id INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  doctor_id INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  appointment_date DATE NOT NULL,
  appointment_time TIME WITHOUT TIME ZONE NOT NULL,
  reason TEXT NOT NULL,
  notes TEXT,
  mode TEXT NOT NULL DEFAULT 'In-Person',
  is_urgent BOOLEAN NOT NULL DEFAULT FALSE,
  status TEXT NOT NULL DEFAULT 'PENDING',
  decline_reason TEXT,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
  acted_at TIMESTAMP WITHOUT TIME ZONE,
  CONSTRAINT appointment_requests_status_check
    CHECK (status IN ('PENDING', 'CONFIRMED', 'DECLINED')),
  CONSTRAINT appointment_requests_mode_check
    CHECK (mode IN ('In-Person', 'Video', 'Phone'))
);

CREATE TABLE IF NOT EXISTS staff_roster (
  roster_id BIGSERIAL PRIMARY KEY,
  staff_id BIGINT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  staff_name VARCHAR(100) NOT NULL,
  staff_role roster_user_role NOT NULL,
  shift_date DATE NOT NULL,
  shift shift_type NOT NULL,
  is_deleted BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (staff_id, shift_date, shift)
);

CREATE TABLE IF NOT EXISTS ambulance_contact (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  phone_bn TEXT,
  phone_en TEXT,
  is_primary BOOLEAN DEFAULT FALSE,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_users_role ON users(role);
CREATE INDEX IF NOT EXISTS idx_notifications_user ON notifications(user_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_prescriptions_patient ON prescriptions(patient_id, prescription_date DESC);
CREATE INDEX IF NOT EXISTS idx_test_results_created ON test_results(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_uploadpatientr_patient ON "UploadpatientR"(patient_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_appointment_requests_doctor_status_date ON appointment_requests (doctor_id, status, appointment_date, appointment_time);
CREATE INDEX IF NOT EXISTS idx_appointment_requests_patient_created ON appointment_requests (patient_id, created_at DESC);

COMMIT;
