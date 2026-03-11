#!/bin/bash

START_TIME=$(date +%s)
read -p "Introduce numero de version: " N_VERSION
if [[ -z "$N_VERSION" ]]; then
    echo "Introduce una version valida"
    exit 1
fi

RELEASE_DIR="release/$N_VERSION"
mkdir -p $RELEASE_DIR
if [[ ! -d "$RELEASE_DIR" ]]; then
    echo "Error al crear directorio"
    exit 1
fi

touch "$RELEASE_DIR/config.yml"
echo "desplegando version, ...comandos..." > "$RELEASE_DIR/config.yml"
touch "$RELEASE_DIR/deploy.sh"
echo "...comandos de deploy..." > "$RELEASE_DIR/deploy.sh"
chmod +x "$RELEASE_DIR/deploy.sh"

DATE=$(date)
touch "$RELEASE_DIR/README.md"
echo "fecha de ejecucion es: $DATE" > "$RELEASE_DIR/README.md"

END_TIME=$(date +%s)
echo "se ha tardado $((END_TIME-START_TIME))"
F_SIZE=$(du -sh "$RELEASE_DIR" | awk '{print $1}')
echo "size of the release is $F_SIZE"
