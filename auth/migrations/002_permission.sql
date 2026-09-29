CREATE TABLE IF NOT EXISTS permissions(
    id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    code VARCHAR(150) NOT NULL,
    description TEXT,
    CONSTRAINT uq_permissions_code
        UNIQUE (code)
)