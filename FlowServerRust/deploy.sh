#!/bin/bash

# Script de déploiement automatique pour FlowServer (Rust) sur la VM Freebox Ultra.
# Usage: ./deploy.sh [utilisateur@ip_de_la_vm]
# Exemple: ./deploy.sh freebox@192.168.1.190

set -e

if [ -z "$1" ]; then
    echo "❌ Erreur: Cible SSH manquante."
    echo "Usage: $0 [utilisateur@ip_de_la_vm]"
    echo "Exemple: $0 freebox@192.168.1.190"
    exit 1
fi

SSH_TARGET=$1
REMOTE_DIR="~/flow-server"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# Vérifier la présence du fichier .env
if [ ! -f ".env" ]; then
    echo "⚠️ Attention: Fichier .env non trouvé localement."
    echo "Veuillez créer un fichier .env avec votre IDFM_API_KEY avant de déployer."
    exit 1
fi

echo "=========================================================="
echo "🦀 1. Compilation Rust (aarch64-unknown-linux-musl)"
echo "=========================================================="
export PATH="$HOME/.cargo/bin:/opt/homebrew/bin:$PATH"
cargo zigbuild --release --target aarch64-unknown-linux-musl

BIN_PATH="target/aarch64-unknown-linux-musl/release/flow-server"
if [ ! -f "$BIN_PATH" ]; then
    echo "❌ Erreur: Binaire introuvable à $BIN_PATH"
    exit 1
fi
cp "$BIN_PATH" ./flow-server
trap 'rm -f "$SCRIPT_DIR/flow-server" /tmp/flow-server.tar.gz' EXIT

echo "=========================================================="
echo "📦 2. Préparation et transfert des fichiers vers $SSH_TARGET"
echo "=========================================================="
tar --exclude="target" --exclude="cache" --exclude="src" --exclude="node_modules" --exclude=".git" --exclude="*.tar.gz" -czf /tmp/flow-server.tar.gz \
    flow-server Dockerfile docker-compose.yml Caddyfile .env etat-des-ascenseurs.csv

ssh "$SSH_TARGET" "mkdir -p $REMOTE_DIR/cache"
scp /tmp/flow-server.tar.gz "$SSH_TARGET:$REMOTE_DIR/"

echo "📂 Extraction sur la VM et nettoyage de l'ancienne version JS..."
ssh "$SSH_TARGET" "cd $REMOTE_DIR && tar -xzf flow-server.tar.gz && rm -f flow-server.tar.gz server.js package.json package-lock.json stops.json generate_stops.py && rm -rf node_modules"

echo "=========================================================="
echo "🐳 3. Démarrage du conteneur Rust sur la VM"
echo "=========================================================="
if ssh "$SSH_TARGET" "cd $REMOTE_DIR && docker compose version >/dev/null 2>&1"; then
    ssh "$SSH_TARGET" "cd $REMOTE_DIR && docker compose up --build -d --remove-orphans"
elif ssh "$SSH_TARGET" "cd $REMOTE_DIR && docker-compose version >/dev/null 2>&1"; then
    ssh "$SSH_TARGET" "cd $REMOTE_DIR && docker-compose up --build -d --remove-orphans"
else
    echo "❌ Erreur: Docker Compose n'est pas installé sur la VM."
    exit 1
fi

echo "=========================================================="
echo "🎉 4. Déploiement Rust terminé avec succès !"
echo "=========================================================="
VM_IP=$(echo "$SSH_TARGET" | cut -d'@' -f2)
echo "Pour suivre les logs : ssh $SSH_TARGET 'cd $REMOTE_DIR && docker compose logs -f'"
echo "Pour tester l'API   : curl http://$VM_IP:3001/api/health"
echo "=========================================================="
