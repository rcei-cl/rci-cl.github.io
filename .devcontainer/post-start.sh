#!/usr/bin/env bash
# Se ejecuta en cada inicio del devcontainer (postStartCommand):
# actualiza RubyGems, Bundler y las gemas del proyecto, y levanta Jekyll
# con autoreload en segundo plano.
set -uo pipefail

cd "$(dirname "$0")/../docs"

echo "Actualizando RubyGems..."
gem update --system --no-document

echo "Actualizando Bundler..."
gem update bundler --no-document

echo "Actualizando dependencias del sitio (bundle update)..."
bundle install --gemfile=Gemfile
bundle update --gemfile=Gemfile

echo "Iniciando Jekyll con autoreload..."
nohup bundle exec --gemfile=Gemfile jekyll serve \
  --source . \
  --destination _site \
  --livereload \
  --host 0.0.0.0 \
  > /tmp/jekyll.log 2>&1 &

disown
echo "Jekyll sirviendo en http://localhost:4000 (log en /tmp/jekyll.log)"
