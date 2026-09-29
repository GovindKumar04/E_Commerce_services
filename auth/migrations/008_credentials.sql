CREATE TABLE IF NOT EXISTS credentials (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    user_id UUID NOT NULL,

    provider credential_provider NOT NULL,
    provider_uid VARCHAR(255),

    password_hash TEXT,

    is_verified BOOLEAN NOT NULL DEFAULT FALSE,

    last_login_at TIMESTAMPTZ,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_credentials_provider_user
        UNIQUE (user_id, provider),

    CONSTRAINT uq_credentials_provider_uid
        UNIQUE (provider, provider_uid)
);