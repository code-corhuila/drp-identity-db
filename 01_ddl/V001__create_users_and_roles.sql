-- identity schema already exists in drp-infra-postgres (Anexo J).
-- This repo must NOT CREATE EXTENSION or CREATE SCHEMA.
-- Flyway runs as identity_app with search_path=identity.
-- Changelog table: flyway_identity_history (per-domain control table).

CREATE TABLE users (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email         VARCHAR(320) NOT NULL,
  password_hash TEXT NOT NULL,
  display_name  VARCHAR(200) NOT NULL,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  deleted_at    TIMESTAMPTZ,
  UNIQUE (email)
);

CREATE TABLE user_roles (
  user_id UUID NOT NULL REFERENCES users(id),
  role    VARCHAR(32) NOT NULL CHECK (role IN ('USER', 'ADMIN')),
  PRIMARY KEY (user_id, role)
);
