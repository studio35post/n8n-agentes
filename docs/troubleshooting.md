# Solución de problemas

Versión resumida del Anexo B del libro, con los fallos que aparecen al
levantar la instalación de `infra/` e importar estos workflows.

## La interfaz carga pero no deja iniciar sesión

Mensaje: *«Your n8n server is configured to use a secure cookie, however you
are either visiting this via an insecure URL, or using Safari.»*

`N8N_SECURE_COOKIE` vale `true` por defecto y hace que el navegador solo
envíe la cookie de sesión por HTTPS. Al entrar por `http://` contra una IP o
un nombre de máquina, la sesión nunca se reconoce. El `docker-compose.yml` de
`infra/` ya la deja en `"false"` para uso local. **En cuanto la instancia se
exponga a internet, borra esa línea y pon delante un proxy inverso con TLS**
(capítulo 16).

## El respaldo del volumen sale vacío

Docker Compose antepone el nombre del proyecto al de cada volumen: lo que el
archivo declara como `n8n_data` existe como `<carpeta>_n8n_data`. Si se pasa
el nombre corto, Docker **crea un volumen nuevo y vacío** sin dar error y el
`.tar.gz` resultante no contiene nada. Comprueba primero el nombre real:

```bash
docker volume ls
docker run --rm -v <nombre_real>:/data -v "$(pwd)":/backup alpine \
  tar czf /backup/n8n_backup.tar.gz -C /data .
```

Un respaldo real pesa megabytes. Si pesa unos cientos de bytes, está vacío.

## El disparador programado se ejecuta a otra hora

El contenedor usa UTC si no se fija `GENERIC_TIMEZONE`. Está en
`.env.example` con formato IANA (`Europe/Madrid`, `America/Bogota`), no como
desplazamiento numérico.

## El workflow importado aparece con avisos en los nodos

Es lo normal: las credenciales no viajan dentro del JSON. Cada carpeta indica
en su `README.md` qué credenciales necesita ese workflow (Ollama, PostgreSQL,
Qdrant, IMAP…). Asígnalas y el aviso desaparece.

## El webhook no recibe nada desde internet

Define `WEBHOOK_URL` con la dirección pública completa. Sin esa variable, n8n
deduce la URL y suele generar una interna que el emisor externo no alcanza.
En desarrollo, con un túnel tipo ngrok, recuerda que en el plan gratuito la
URL cambia en cada arranque y hay que actualizar `WEBHOOK_URL` cada vez.
