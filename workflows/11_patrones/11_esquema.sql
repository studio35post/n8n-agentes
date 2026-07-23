-- Clave de idempotencia (cap. 11).
CREATE TABLE IF NOT EXISTS pedidos (
  id                  BIGSERIAL PRIMARY KEY,
  clave_idempotencia  TEXT UNIQUE NOT NULL,
  payload             JSONB NOT NULL,
  creado_en           TIMESTAMPTZ NOT NULL DEFAULT now()
);
