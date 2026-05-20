# FlowServer

Serveur backend pour l'app **Flow** — proxy vers l'API IDFM/Navitia.

## Installation locale

```bash
# Installer les dépendances
npm install

# Configurer l'API key (déjà fait si tu as le .env)
cp .env.example .env
# Éditer .env et mettre ta clé IDFM_API_KEY

# Lancer le serveur
npm start

# Ou en mode développement (redémarrage auto)
npm run dev
```

Le serveur démarre sur `http://localhost:3001`.

## Endpoints

| Méthode | Endpoint | Description |
|---------|----------|-------------|
| `GET` | `/api/health` | Santé du serveur |
| `GET` | `/api/departures/:stationId` | Prochains départs d'une station |
| `GET` | `/api/traffic` | Infos trafic (cache 2 min) |
| `GET` | `/api/itinerary?from=...&to=...` | Recherche d'itinéraire |

### Exemples

```bash
# Santé du serveur
curl http://localhost:3001/api/health

# Prochains départs (Châtelet)
curl http://localhost:3001/api/departures/stop_area:IDFM:71264

# Infos trafic
curl http://localhost:3001/api/traffic

# Itinéraire
curl "http://localhost:3001/api/itinerary?from=2.3522;48.8566&to=2.2945;48.8738"
```

## Déploiement

### Docker

```bash
docker build -t flow-server .
docker run -p 3001:3001 --env-file .env flow-server
```

### Services cloud

Ce serveur fonctionne sur n'importe quel service Node.js :
- **Railway** : `railway up`
- **Render** : connecter le repo GitHub
- **Fly.io** : `fly launch`
- **VPS** : `npm install && npm start` (avec PM2 pour la persistance)

> **Important** : Pensez à définir la variable `IDFM_API_KEY` dans les variables d'environnement du service cloud.
