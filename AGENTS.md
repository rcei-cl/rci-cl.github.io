# AGENTS.md

Guía para agentes (y humanos) que trabajen en este repositorio.

## Qué es este repositorio

Sitio web público de la **Red Chilena de Ética en Investigación (RCEI)**,
una red que busca reunir a los Comités Ético-Científicos e Instituciones de
Investigación de Chile para promover la colaboración, el fortalecimiento de
las capacidades de evaluación ética y las buenas prácticas en investigación.

Es un sitio estático generado con **Jekyll** y publicado con **GitHub
Pages**, servido bajo el dominio propio **rcei.cl**.

## Estructura

```text
docs/                  ← raíz del sitio Jekyll (GitHub Pages sirve desde aquí)
  _config.yml           configuración del sitio (título, nav, plugins)
  _layouts/              plantillas HTML (default.html)
  _includes/             fragmentos reutilizables (header.html, footer.html)
  _sass/ + assets/css/   estilos (SCSS)
  index.md               página de inicio
  quienes-somos.md       página "Quiénes somos"
  comites.md              página "Comités Ético-Científicos"
  contacto.md             página de contacto
  404.md                  página de error 404
  CNAME                   dominio personalizado (rcei.cl)
  Gemfile                 dependencias Ruby (gem github-pages)
```

El repositorio se llama `rcei-cl/rci-cl.github.io` en GitHub; el sitio
publicado se ve en `rcei.cl` gracias al archivo `docs/CNAME`. GitHub Pages
está configurado para construir desde la carpeta `/docs` de la rama `main`
(no se usa GitHub Actions para el build).

## Devcontainer

El [devcontainer](.devcontainer/devcontainer.json) instala las gemas al
crearse (`postCreateCommand`) y, en cada inicio (`postStartCommand`), corre
[.devcontainer/post-start.sh](.devcontainer/post-start.sh), que:

1. Actualiza RubyGems (`gem update --system`) y Bundler.
2. Actualiza las dependencias del sitio (`bundle install` + `bundle update`
   sobre `docs/Gemfile`).
3. Levanta `jekyll serve --livereload` en segundo plano
   (`http://localhost:4000`, log en `/tmp/jekyll.log`).

Si necesitas fijar una gema a una versión concreta (por ejemplo porque una
actualización rompe el build), agrégala con esa versión en `docs/Gemfile`
en vez de desactivar las actualizaciones automáticas.

## Cómo trabajar en el sitio

Todo el código del sitio vive dentro de `docs/`. Ejecuta los comandos desde
esa carpeta:

```bash
cd docs
bundle install     # instala Jekyll y dependencias (gem github-pages)
bundle exec jekyll serve   # sirve el sitio en http://localhost:4000
bundle exec jekyll build   # genera el sitio estático en docs/_site
```

Usa el gem `github-pages` en el `Gemfile` en vez de fijar una versión de
Jekyll a mano, para que el build local coincida con el entorno real de
GitHub Pages. Si cambias de gem o de versión, corre `bundle update` y
verifica que siga siendo compatible con lo que soporta GitHub Pages
(<https://pages.github.com/versions/>).

## Convenciones de contenido

- El sitio es en español (`es-CL`). Mantén un tono institucional, claro y
  cercano, acorde a una red de comités de ética.
- Las páginas de contenido son archivos Markdown con front matter
  (`layout: default`, `title`, y `permalink` cuando el nombre de archivo no
  coincide con la URL deseada).
- La navegación principal se define en `docs/_config.yml` bajo la clave
  `nav`; agrega ahí cualquier página nueva que deba aparecer en el menú.
- Los estilos van en `docs/_sass/base.scss`; `docs/assets/css/style.scss`
  solo importa los partials. No metas CSS suelto en los layouts.
- Prefiere HTML semántico simple sobre frameworks o JS adicional: el sitio
  no tiene build step de JavaScript ni dependencias de terceros más allá de
  Jekyll y sus plugins (`jekyll-sitemap`, `jekyll-seo-tag`).

## Antes de dar por terminado un cambio

- Corre `bundle exec jekyll build` (o `jekyll doctor`) desde `docs/` y
  confirma que no hay errores.
- Revisa visualmente con `jekyll serve` cuando el cambio afecte layout,
  navegación o estilos.
- No borres ni muevas `docs/CNAME`: es lo que mantiene el dominio
  `rcei.cl` apuntando al sitio.
