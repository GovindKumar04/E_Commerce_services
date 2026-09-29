CREATE TABLE IF NOT EXISTS user_roles(
    user_id UUID NOT NULL,
    role_id UUID NOT NULL,
    scope_id UUID NOT NULL,
    PRIMARY KEY(user_id, role_id, scope_id),
    FOREIGN KEY role_id REFERENCES roles(id) ON DELETE CASCADE,
    granted_by UUID,
    granted_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
)