CREATE EXTENSION IF NOT EXISTS 'pgcrypto'

CREATE TABLE IF NOT EXISTS roles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    code VARCHAR(100) NOT NULL,
    name VARCHAR(150) NOT NULL,

    scope role_scope NOT NULL,

    CONSTRAINT uq_roles_code
        UNIQUE (code)
);