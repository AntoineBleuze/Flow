#!/bin/bash

# Script de déploiement automatique pour FlowServer sur la VM Freebox Ultra.
# Usage: ./deploy.sh [utilisateur@ip_de_la_vm]
# Exemple: ./deploy.sh ubuntu@192.168.1.50

if [ -z "$1" ]; then
    echo "❌ Erreur: Cible SSH manquante."
    echo "Usage: $0 [utilisateur@ip_de_la_vm]"
    echo "Exemple: $0 ubuntu@192.168.1.50"
    exit 1
fi

SSH_TARGET=$1
REMOTE_DIR="~/flow-server"

# Vérifier la présence du fichier .env
if [ ! -f ".env" ]; then
    echo "⚠️ Attention: Fichier .env non trouvé localement."
    echo "Veuillez créer un fichier .env avec votre IDFM_API_KEY avant de déployer."
    exit 1
fi

echo "=========================================================="
echo "📦 1. Préparation et transfert des fichiers vers $SSH_TARGET"
echo "=========================================================="

# Créer une archive temporaire sans les dossiers inutiles (comme node_modules)
echo "⚡ Création de l'archive temporaire..."
tar --exclude="node_modules" --exclude=".git" --exclude="*.tar.gz" -czf /tmp/flow-server.tar.gz .

# Créer le répertoire de destination sur la VM et transférer l'archive
echo "🚀 Connexion SSH et transfert..."
ssh "$SSH_TARGET" "mkdir -p $REMOTE_DIR"
if [ $? -ne 0 ]; then
    echo "❌ Erreur de connexion SSH vers $SSH_TARGET. Vérifiez l'IP et les identifiants."
    rm -f /tmp/flow-server.tar.gz
    exit 1
fi

scp /tmp/flow-server.tar.gz "$SSH_TARGET:$REMOTE_DIR/"
if [ $? -ne 0 ]; then
    echo "❌ Erreur lors du transfert du fichier scp."
    rm -f /tmp/flow-server.tar.gz
    exit 1
fi

# Extraire l'archive sur la VM
echo "📂 Extraction des fichiers sur la VM..."
ssh "$SSH_TARGET" "cd $REMOTE_DIR && tar -xzf flow-server.tar.gz && rm flow-server.tar.gz"

# Nettoyer l'archive locale
rm -f /tmp/flow-server.tar.gz

echo "=========================================================="
echo "🐳 2. Démarrage de l'image Docker sur la VM"
echo "=========================================================="

# Vérifier si docker compose est disponible sur la VM
ssh "$SSH_TARGET" "cd $REMOTE_DIR && docker compose version >/dev/null 2>&1"
if [ $? -eq 0 ]; then
    echo "✨ Docker Compose détecté. Lancement des conteneurs..."
    ssh -t "$SSH_TARGET" "cd $REMOTE_DIR && docker compose up --build -d"
else
    # Essayer l'ancienne syntaxe docker-compose
    ssh "$SSH_TARGET" "cd $REMOTE_DIR && docker-compose version >/dev/null 2>&1"
    if [ $? -eq 0 ]; then
        echo "✨ Ancien docker-compose détecté. Lancement..."
        ssh -t "$SSH_TARGET" "cd $REMOTE_DIR && docker-compose up --build -d"
    else
        echo "❌ Erreur: Docker Compose n'est pas installé sur la VM."
        echo "Veuillez installer docker et docker-compose sur votre machine virtuelle."
        echo "Commande recommandée pour Ubuntu/Debian :"
        echo "   sudo apt-get update && sudo apt-get install -y docker-compose-plugin docker-buildx-plugin"
        exit 1
    fi
fi

echo "=========================================================="
echo "🎉 3. Déploiement terminé avec succès !"
echo "=========================================================="
# Extraire l'IP pure pour la commande curl de test
VM_IP=$(echo "$SSH_TARGET" | cut -d'@' -f2)
echo "Pour suivre les logs : ssh $SSH_TARGET 'cd $REMOTE_DIR && docker compose logs -f'"
echo "Pour tester l'API   : curl http://$VM_IP:3001/api/health"
echo "=========================================================="
