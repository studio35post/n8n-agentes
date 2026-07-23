# Automatización agéntica con n8n — Material del libro

Repositorio companion del libro **«Automatización agéntica con n8n»**
(Henry Ramírez Reyes, serie INTELIGENCIA ARTIFICIAL, Studio35).

Aquí viven los workflows del libro, exportados en JSON y listos para
importar en n8n. El Anexo A del libro explica, paso a paso y sin
experiencia previa, cómo descargar este repositorio y cómo importar un
workflow.

## Cómo usar este repositorio

1. Descarga el repositorio: botón verde **Code → Download ZIP** (no hace
   falta cuenta de GitHub) y descomprime el archivo.
2. En n8n: **Workflows → Import from File** y elige el `.json` del
   capítulo que estés leyendo.
3. Revisa las credenciales que el workflow necesita (cada carpeta lo
   indica en su README).

## Correspondencia capítulo → workflow

| Capítulo | Carpeta |
| --- | --- |
| 3. El lenguaje de los flujos | `workflows/03_lenguaje/` |
| 4. Conectar el mundo | `workflows/04_conectar/` |
| 5. El nodo de agente por dentro | `workflows/05_agente/` |
| 6. Herramientas para el agente | `workflows/06_herramientas/` |
| 7. Memoria y contexto | `workflows/07_memoria/` |
| 8. RAG en n8n | `workflows/08_rag/` |
| 9. MCP y el ecosistema | `workflows/09_mcp/` |
| 10. Proyecto: el asistente interno | `workflows/10_asistente/` |
| 11. Patrones de producción | `workflows/11_patrones/` |
| 12. Multi-agente en n8n | `workflows/12_multiagente/` |
| 13. Canales | `workflows/13_canales/` |
| 15. Proyecto: atención a clientes | `workflows/15_atencion/` |
| 19. Proyecto: el proceso completo | `workflows/19_proceso/` |

Los workflows se publican junto con el libro; cada uno se exporta de una
instancia real de n8n y se prueba antes de subirlo.

## Licencia

MIT para los workflows y el código. El texto del libro tiene todos los
derechos reservados.
