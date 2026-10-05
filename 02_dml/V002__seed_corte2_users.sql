-- Corte 2 seed emails match drp-front synthetic accounts.
-- password_hash is a placeholder: drp-identity-api (bcrypt) owns the real hash.
-- Frontend Corte 2 does not read this table (synthetic adapter).

INSERT INTO users (id, email, password_hash, display_name)
VALUES
  (
    '44444444-4444-4444-4444-444444444444',
    'member@spacehub.local',
    'PENDING_HASH_FROM_IDENTITY_API',
    'Ana Reserva'
  ),
  (
    '66666666-6666-6666-6666-666666666666',
    'admin@spacehub.local',
    'PENDING_HASH_FROM_IDENTITY_API',
    'Admin SpaceHub'
  );

INSERT INTO user_roles (user_id, role)
VALUES
  ('44444444-4444-4444-4444-444444444444', 'USER'),
  ('66666666-6666-6666-6666-666666666666', 'ADMIN');
