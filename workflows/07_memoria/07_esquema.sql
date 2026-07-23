-- Esquema ampliado del capitulo 7: sesion y mensaje separados.
CREATE TABLE IF NOT EXISTS sesiones (
  id          TEXT PRIMARY KEY,          -- session_id normalizado
  canal       TEXT NOT NULL,
  cliente_id  TEXT,
  creada_en   TIMESTAMPTZ NOT NULL DEFAULT now(),
  resumen     TEXT                        -- resumen acumulado (estrategia 2)
);

CREATE TABLE IF NOT EXISTS mensajes (
  id          BIGSERIAL PRIMARY KEY,
  sesion_id   TEXT NOT NULL REFERENCES sesiones(id),
  rol         TEXT NOT NULL CHECK (rol IN ('user', 'assistant', 'system')),
  contenido   TEXT NOT NULL,
  creado_en   TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_mensajes_sesion ON mensajes (sesion_id, creado_en);

-- Escritura concurrente sobre la misma sesion (cap. 7): advisory lock.
-- SELECT pg_advisory_xact_lock(hashtext($1));  -- $1 = session_id
