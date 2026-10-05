-- Manual rollback for empty/local volumes only. Shared env: fix forward.
-- Does not run automatically.

DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS users;
