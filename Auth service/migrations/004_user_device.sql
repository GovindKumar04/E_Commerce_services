CREATE TYPE device_platform AS ENUM (
    'android',
    'ios',
    'web'
);

CREATE TABLE IF NOT EXISTS user_devices (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    platform device_platform NOT NULL,

    push_token TEXT NOT NULL,

    app_version VARCHAR(50),

    last_seen_at TIMESTAMPTZ NOT NULL DEFAULT NOW() ,

    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);