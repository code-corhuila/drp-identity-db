-- identity_app already has USAGE, CREATE on schema identity (infra init).
-- Tables created by Flyway are owned by identity_app. Extra GRANTs for
-- cross-schema SELECT are debt and need an ADR; none in Corte 2.

GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA identity TO identity_app;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA identity TO identity_app;
-- No DELETE: users.deleted_at is the soft-delete path.
