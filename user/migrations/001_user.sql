CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),

    email VARCHAR(255) NOT NULL UNIQUE,

    country_code VARCHAR(5) NOT NULL,
    phone_number VARCHAR(15) UNIQUE,

    user_password TEXT NOT NULL,

    account_status VARCHAR(20) NOT NULL DEFAULT 'active'
        CHECK (
            account_status IN (
                'active',
                'inactive',
                'suspended',
                'blocked',
                'deleted'
            )
        ),

    referral_code VARCHAR(50),
    preffered_language VARCHAR(50),

    email_verified BOOLEAN NOT NULL DEFAULT FALSE,
    phone_verified BOOLEAN NOT NULL DEFAULT FALSE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    deleted_at TIMESTAMPTZ
);