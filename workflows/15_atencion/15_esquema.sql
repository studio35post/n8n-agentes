-- Identidad de negocio y estado de caso (cap. 15).
CREATE TABLE IF NOT EXISTS clientes (
  cliente_id  TEXT PRIMARY KEY,
  nombre      TEXT,
  creado_en   TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS identidades (
  canal          TEXT NOT NULL,          -- whatsapp, correo, telegram...
  id_plataforma  TEXT NOT NULL,          -- id tecnico del canal
  cliente_id     TEXT NOT NULL REFERENCES clientes(cliente_id),
  PRIMARY KEY (canal, id_plataforma)
);

CREATE TABLE IF NOT EXISTS casos (
  caso_id     BIGSERIAL PRIMARY KEY,
  cliente_id  TEXT NOT NULL,
  canal       TEXT NOT NULL,
  estado      TEXT NOT NULL,             -- abierto, resuelto, escalado_humano
  detalle     JSONB,
  creado_en   TIMESTAMPTZ NOT NULL DEFAULT now()
);
