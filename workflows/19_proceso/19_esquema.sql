-- Registro y auditoria del proceso de leads (cap. 19).
CREATE TABLE IF NOT EXISTS leads (
  id         BIGSERIAL PRIMARY KEY,
  clave      TEXT UNIQUE NOT NULL,       -- clave de idempotencia
  remitente  TEXT NOT NULL,
  canal      TEXT NOT NULL,
  categoria  TEXT NOT NULL,
  confianza  NUMERIC NOT NULL,
  respuesta  TEXT,
  creado_en  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS auditoria_llm (
  id           BIGSERIAL PRIMARY KEY,
  etapa        TEXT NOT NULL,            -- clasificacion | redaccion
  modelo       TEXT NOT NULL,
  tokens_in    INT, tokens_out INT,
  coste_eur    NUMERIC,
  creado_en    TIMESTAMPTZ NOT NULL DEFAULT now()
);
