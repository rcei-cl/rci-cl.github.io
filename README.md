# rcei.cl

Sitio web público de la **Red Chilena de Ética en Investigación (RCEI)**,
la red que reúne a los Comités Ético-Científicos e instituciones de
investigación de Chile para promover la colaboración, el fortalecimiento de
las capacidades de evaluación ética y las buenas prácticas en investigación.

El sitio está construido con [Jekyll](https://jekyllrb.com/) y se publica
con GitHub Pages en [rcei.cl](https://rcei.cl).

## Estructura

El código del sitio vive en [`docs/`](docs/), que es la carpeta que GitHub
Pages usa como raíz de publicación. Ver [AGENTS.md](AGENTS.md) para el
detalle de la estructura y las convenciones del proyecto.

## Desarrollo local

Este repo incluye un [devcontainer](.devcontainer/devcontainer.json) con
Ruby y Jekyll listos para usar (VS Code / GitHub Codespaces). Al iniciarse,
el devcontainer instala las dependencias y levanta el sitio automáticamente
en `http://localhost:4000` con recarga automática (`--livereload`).

Para hacerlo manualmente:

```bash
cd docs
bundle install
bundle exec jekyll serve --livereload
```

El sitio queda disponible en `http://localhost:4000`.
