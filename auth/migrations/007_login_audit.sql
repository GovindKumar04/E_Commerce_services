CREATE TABLE IF NOT EXISTS login_audit (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID,
    device_id UUID,
    ip_address INET,
    user_agent TEXT,
    result login_result NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);