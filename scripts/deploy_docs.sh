#!/usr/bin/env bash
# Gera o build web do Flutter e coloca em docs/ para GitHub Pages.
# Uso: ./scripts/deploy_docs.sh

set -e
cd "$(dirname "$0")/.."

echo "→ flutter pub get"
flutter pub get

# Para GitHub Pages a partir da pasta docs/, a URL é https://<usuario>.github.io/portifolio/
# Se o nome do repositório for outro, altere BASE_HREF (ex.: /meu-portfolio/)
BASE_HREF="/portifolio/"
echo "→ flutter build web (base-href $BASE_HREF)"
flutter build web --base-href "/portifolio/"

echo "→ Limpando docs/ e copiando build/web → docs/"
rm -rf docs/*
cp -R build/web/* docs/

echo "✓ Pronto. Faça commit e push da pasta docs/ para atualizar o GitHub Pages."
echo "  Ex.: git add docs && git commit -m 'chore: atualiza build para GitHub Pages' && git push"

flutter build web --base-href "/portifolio/"
rm -rf docs/*
cp -R build/web/* docs/