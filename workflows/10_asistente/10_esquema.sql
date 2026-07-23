-- Trazabilidad del asistente interno (cap. 10).
CREATE TABLE IF NOT EXISTS asistente_registro (
  id          BIGSERIAL PRIMARY KEY,
  message_id  TEXT UNIQUE NOT NULL,   -- clave de idempotencia
  remitente   TEXT NOT NULL,
  accion      TEXT NOT NULL,
  decision    TEXT NOT NULL,
  detalle     JSONB,
  creado_en   TIMESTAMPTZ NOT NULL DEFAULT now()
);
