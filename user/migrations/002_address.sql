CREATE TYPE user_address_type AS ENUM (
    'home',
    'office',
    'outside'
);

CREATE TABLE IF NOT EXISTS addresses (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,

    label user_address_type NOT NULL DEFAULT 'home',

    line_1 VARCHAR(255) NOT NULL,
    line_2 VARCHAR(255),
    landmark VARCHAR(255),

    city VARCHAR(100) NOT NULL,
    district VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    pincode VARCHAR(10) NOT NULL,

    lat VARCHAR(100) NOT NULL,
    lng VARCHAR(100) NOT NULL,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    deleted_at TIMESTAMPTZ
);