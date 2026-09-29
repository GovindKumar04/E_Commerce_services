CREATE TABLE IF NOT EXISTS redis_session (
    redis_key VARCHAR(255) PRIMARY KEY NOT NULL,
    user_id UUID NOT NULL REFERENCES user(id),
    device_id UUID NOT NULL REFERENCES device(id),
    refresh_id UUID NOT NULL REFERENCES refresh_token(id),
    ttl_seconds INTEGER NOT NULL
)