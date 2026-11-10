-- Seeds are synthetic roles, not people. Do not use given names.
UPDATE identity.users
SET display_name = 'Member SpaceHub'
WHERE id = '44444444-4444-4444-4444-444444444444';

UPDATE identity.users
SET display_name = 'Admin SpaceHub'
WHERE id = '66666666-6666-6666-6666-666666666666';
