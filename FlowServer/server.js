// ============================================================
// FlowServer — Backend proxy pour l'app Flow (IDFM/Navitia)
// Avec WebSocket push + auto-refresh toutes les minutes
// ============================================================

require("dotenv").config();
const express = require("express");
const cors = require("cors");
const http = require("http");
const { WebSocketServer, WebSocket } = require("ws");
const fs = require("fs");
const path = require("path");

// --- Système de capture des logs en mémoire ---
const originalLog = console.log;
const originalError = console.error;
const originalWarn = console.warn;
const serverLogs = [];
const MAX_LOG_LINES = 1000;

function formatTime() {
  return new Date().toLocaleTimeString("fr-FR", { timeZone: "Europe/Paris" });
}

console.log = function(...args) {
  const msg = args.join(' ');
  originalLog.apply(console, args);
  serverLogs.push(`[${formatTime()}] [INFO] ${msg}`);
  if (serverLogs.length > MAX_LOG_LINES) serverLogs.shift();
};

console.error = function(...args) {
  const msg = args.join(' ');
  originalError.apply(console, args);
  serverLogs.push(`[${formatTime()}] [ERROR] ${msg}`);
  if (serverLogs.length > MAX_LOG_LINES) serverLogs.shift();
};

console.warn = function(...args) {
  const msg = args.join(' ');
  originalWarn.apply(console, args);
  serverLogs.push(`[${formatTime()}] [WARN] ${msg}`);
  if (serverLogs.length > MAX_LOG_LINES) serverLogs.shift();
};
// ----------------------------------------------

const app = express();
const PORT = process.env.PORT || 3001;
const IDFM_API_KEY = process.env.IDFM_API_KEY;
const NAVITIA_BASE = "https://prim.iledefrance-mobilites.fr/marketplace/v2/navitia";
const TRAFFIC_REFRESH_INTERVAL_MS = 5 * 60 * 1000; // 5 minutes (300 secondes)
const ACTIVE_REFRESH_INTERVAL_MS = 20 * 1000; // 20 secondes

if (!IDFM_API_KEY) {
  console.error("❌ IDFM_API_KEY manquante ! Configurez le fichier .env");
  process.exit(1);
}

// ============================================================
// Serveur HTTP + WebSocket
// ============================================================
const server = http.createServer(app);
const wss = new WebSocketServer({ server });

// Middleware
app.use(cors());
app.use(express.json());


// Logger simple
app.use((req, res, next) => {
  const timestamp = new Date().toLocaleTimeString("fr-FR", { timeZone: "Europe/Paris" });
  console.log(`[${timestamp}] ${req.method} ${req.path}`);
  next();
});

// ============================================================
// Cache mémoire global — mis à jour toutes les minutes
// ============================================================
const cache = {
  traffic: { data: null, slimData: null, timestamp: 0 },
  lastFullUpdate: null,
  departures: {}, // stopId -> { data: [], timestamp: Date }
};

const CACHE_DIR = path.join(__dirname, "cache");
if (!fs.existsSync(CACHE_DIR)) {
  fs.mkdirSync(CACHE_DIR, { recursive: true });
}
const CACHE_FILE = path.join(CACHE_DIR, "cache_departures.json");

// Charger le cache depuis le fichier au démarrage
function loadPersistentCache() {
  try {
    if (fs.existsSync(CACHE_FILE)) {
      const data = fs.readFileSync(CACHE_FILE, "utf8");
      const parsed = JSON.parse(data);
      // Restaurer le cache
      cache.departures = parsed;
      console.log(`💾 [Persistent Cache] ${Object.keys(parsed).length} arrêts restaurés depuis le cache disque.`);
    } else {
      console.log("💾 [Persistent Cache] Aucun cache disque trouvé, démarrage avec un cache vide.");
    }
  } catch (err) {
    console.error("❌ [Persistent Cache] Erreur lors du chargement du cache:", err.message);
  }
}

// Sauvegarder le cache sur le disque
function savePersistentCache() {
  try {
    const now = Date.now();
    const cleanCache = {};
    let keptCount = 0;
    
    // Conserver uniquement les départs récents (moins de 2 heures) pour éviter un fichier trop volumineux
    for (const [stopId, item] of Object.entries(cache.departures)) {
      if (now - item.timestamp < 2 * 60 * 60 * 1000) {
        cleanCache[stopId] = item;
        keptCount++;
      }
    }
    
    fs.writeFileSync(CACHE_FILE, JSON.stringify(cleanCache), "utf8");
    console.log(`💾 [Persistent Cache] Sauvegarde effectuée (${keptCount} arrêts conservés).`);
  } catch (err) {
    console.error("❌ [Persistent Cache] Erreur lors de la sauvegarde du cache:", err.message);
  }
}

const API_DELAY_MS = parseInt(process.env.API_DELAY_MS || "200", 10);

// ============================================================
// Gestion des abonnements globaux
// ============================================================
const activeStopCounts = new Map(); // stopId -> count

function addStopInterest(stopIds) {
  stopIds.forEach((id) => {
    const current = activeStopCounts.get(id) || 0;
    activeStopCounts.set(id, current + 1);
  });
}

function removeStopInterest(stopIds) {
  if (!stopIds) return;
  stopIds.forEach((id) => {
    const current = activeStopCounts.get(id) || 0;
    if (current > 1) {
      activeStopCounts.set(id, current - 1);
    } else {
      activeStopCounts.delete(id);
    }
  });
}

// ============================================================
// Queue de requêtes pour éviter le 429 (Rate Limit)
// Navitia/IDFM limite le nombre d'appels simultanés.
// Processus à concurrence limitée pour optimiser le parallélisme
// ============================================================
const navitiaQueue = [];
let activeRequestsCount = 0;
const MAX_CONCURRENT_REQUESTS = 6;

async function processNavitiaQueue() {
  if (activeRequestsCount >= MAX_CONCURRENT_REQUESTS || navitiaQueue.length === 0) {
    return;
  }

  activeRequestsCount++;
  const { url, resolve, reject } = navitiaQueue.shift();

  // Déclencher d'autres requêtes en parallèle si la file le permet
  processNavitiaQueue();

  try {
    const timestamp = new Date().toLocaleTimeString("fr-FR", { timeZone: "Europe/Paris" });
    const response = await fetch(url, {
      headers: { apiKey: IDFM_API_KEY },
    });

    if (!response.ok) {
      const text = await response.text();
      if (response.status === 429) {
        console.warn(`[${timestamp}] ⚠️ 429 détecté, attente et retry dans 2s...`);
        navitiaQueue.unshift({ url, resolve, reject });
        setTimeout(() => {
          activeRequestsCount--;
          processNavitiaQueue();
        }, 2000);
        return;
      }
      throw new Error(`Navitia ${response.status}: ${text}`);
    }

    const data = await response.json();
    resolve(data);
  } catch (err) {
    reject(err);
  } finally {
    activeRequestsCount--;
    // Relancer la file
    processNavitiaQueue();
  }
}

function navitiaFetch(url) {
  return new Promise((resolve, reject) => {
    navitiaQueue.push({ url, resolve, reject });
    processNavitiaQueue();
  });
}

// ============================================================
// Helper : pagination automatique pour les line_reports
// ============================================================
async function fetchAllPages(initialUrl, maxPages = 20) {
  let url = initialUrl;
  let allDisruptions = [];
  let page = 0;

  while (url && page < maxPages) {
    const data = await navitiaFetch(url);

    if (data.disruptions) {
      allDisruptions = allDisruptions.concat(data.disruptions);
    }

    // Chercher le lien "next"
    url = null;
    if (data.links) {
      const nextLink = data.links.find((l) => l.rel === "next");
      if (nextLink) url = nextLink.href;
    }
    page++;
  }

  return allDisruptions;
}

// ============================================================
// Helper : alléger les disruptions pour le WebSocket
// Garde uniquement les champs utilisés par l'app (id, status,
// cause, category, severity, premier message, impacted_objects)
// Réduit ~10MB → ~500KB
// ============================================================
function slimDisruptions(disruptions) {
  return disruptions.map((d) => ({
    id: d.id,
    status: d.status,
    cause: d.cause,
    category: d.category,
    severity: d.severity
      ? {
        effect: d.severity.effect,
        color: d.severity.color,
        priority: d.severity.priority,
        name: d.severity.name,
      }
      : null,
    // Garder uniquement le premier message texte
    messages: d.messages?.slice(0, 1).map((m) => ({
      text: m.text,
      channel: m.channel ? { name: m.channel.name, content_type: m.channel.content_type } : null,
    })),
    application_periods: d.application_periods,
    updated_at: d.updated_at,
    // Alléger les impacted_objects
    impacted_objects: d.impacted_objects?.map((obj) => ({
      pt_object: obj.pt_object
        ? {
          id: obj.pt_object.id,
          name: obj.pt_object.name,
          line: obj.pt_object.line
            ? {
              id: obj.pt_object.line.id,
              code: obj.pt_object.line.code,
              name: obj.pt_object.line.name,
              commercial_mode: obj.pt_object.line.commercial_mode,
              color: obj.pt_object.line.color,
              text_color: obj.pt_object.line.text_color,
            }
            : null,
        }
        : null,
      impacted_stops: obj.impacted_stops?.map((s) => ({
        stop_point: s.stop_point ? { name: s.stop_point.name } : null,
      })),
      impacted_section: obj.impacted_section
        ? {
          from: obj.impacted_section.from ? { name: obj.impacted_section.from.name } : null,
          to: obj.impacted_section.to ? { name: obj.impacted_section.to.name } : null,
        }
        : null,
    })),
  }));
}

// ============================================================
// Récupération globale du trafic (appelée toutes les minutes)
// ============================================================
async function fetchAllTrafficData() {
  const modes = [
    "physical_mode:Metro",
    "physical_mode:RapidTransit",
    "physical_mode:Tramway",
    "physical_mode:LocalTrain",
    "physical_mode:Bus",
  ];

  // Filtrer depuis 24h
  const since = new Date(Date.now() - 24 * 60 * 60 * 1000);
  const pad = (n) => String(n).padStart(2, "0");
  // Construire la date au format Europe/Paris
  const parisDate = new Date(since.toLocaleString("en-US", { timeZone: "Europe/Paris" }));
  const formattedSince = `${parisDate.getFullYear()}${pad(parisDate.getMonth() + 1)}${pad(parisDate.getDate())}T${pad(parisDate.getHours())}${pad(parisDate.getMinutes())}${pad(parisDate.getSeconds())}`;

  let allDisruptions = [];

  for (const mode of modes) {
    const url = `${NAVITIA_BASE}/line_reports/physical_modes/${mode}/line_reports?count=500&since=${formattedSince}`;
    try {
      const disruptions = await fetchAllPages(url);
      allDisruptions = allDisruptions.concat(disruptions);
    } catch (err) {
      console.error(`   ⚠️ Erreur sur ${mode}: ${err.message}`);
    }
  }

  return { disruptions: allDisruptions };
}

// ============================================================
// Boucle de mise à jour automatique (toutes les minutes)
// ============================================================
async function autoRefresh() {
  const timestamp = new Date().toLocaleTimeString("fr-FR", { timeZone: "Europe/Paris" });
  console.log(`\n🔄 [${timestamp}] Auto-refresh des perturbations trafic...`);

  try {
    const trafficData = await fetchAllTrafficData();
    cache.traffic.data = trafficData;
    cache.traffic.timestamp = Date.now();
    cache.lastFullUpdate = new Date().toISOString();

    // Préparer les données allégées pour le WebSocket
    const slimData = { disruptions: slimDisruptions(trafficData.disruptions || []) };
    cache.traffic.slimData = slimData;

    const count = trafficData.disruptions?.length || 0;
    console.log(`   ✅ ${count} perturbations récupérées`);

    // Push les données allégées aux clients WebSocket
    broadcastToClients({
      type: "traffic_update",
      timestamp: cache.lastFullUpdate,
      data: slimData,
    });
  } catch (error) {
    console.error(`   ❌ Erreur auto-refresh perturbations: ${error.message}`);
  }
}

// ============================================================
// WebSocket — gestion des clients connectés
// ============================================================
function broadcastToClients(message) {
  const payload = JSON.stringify(message);
  let sent = 0;

  wss.clients.forEach((client) => {
    if (client.readyState === WebSocket.OPEN) {
      client.send(payload);
      sent++;
    }
  });

  if (sent > 0) {
    console.log(`   📤 Push envoyé à ${sent} client(s) connecté(s)`);
  }
}

wss.on("connection", (ws, req) => {
  const clientIp = req.socket.remoteAddress;
  const timestamp = new Date().toLocaleTimeString("fr-FR", { timeZone: "Europe/Paris" });
  console.log(`\n🔌 [${timestamp}] Nouveau client WebSocket: ${clientIp}`);
  console.log(`   📊 Total clients: ${wss.clients.size}`);

  // Envoyer immédiatement les dernières données allégées en cache
  if (cache.traffic.slimData) {
    ws.send(
      JSON.stringify({
        type: "traffic_update",
        timestamp: cache.lastFullUpdate,
        data: cache.traffic.slimData,
      })
    );
    console.log(`   📤 Données allégées en cache envoyées au nouveau client`);
  }

  // Gestion des messages du client
  ws.on("message", (message) => {
    try {
      const msg = JSON.parse(message);
      console.log(`   📩 Message reçu: ${msg.type}`);

      // Le client peut demander un refresh manuel
      if (msg.type === "request_refresh") {
        console.log(`   🔄 Refresh manuel demandé par le client`);
        autoRefresh();
      }

      // Gestion de l'abonnement aux départs (Live Activity)
      if (msg.type === "subscribe_departures") {
        const { stopIds, line, direction } = msg.data;
        if (stopIds && stopIds.length > 0) {
          if (ws.departureSubscription) {
            removeStopInterest(ws.departureSubscription.stopIds);
          }

          console.log(
            `   🔔 Abonnement départs: ${stopIds.length} arrets, Ligne ${line}, Dir ${direction}`
          );
          addStopInterest(stopIds);
          ws.departureSubscription = { stopIds, line, direction };

          // Tenter un push immédiat depuis le cache
          pushCachedDepartures(ws);

          // Lancer un refresh immédiat uniquement si pas de cache, cache expiré (> 15s) ou provenant du prefetch global
          const now = Date.now();
          stopIds.forEach((stopId) => {
            const cached = cache.departures[stopId];
            if (!cached || (now - cached.timestamp > 15000) || cached.source === "global") {
              refreshStop(stopId).catch((err) => {
                console.error(`❌ Erreur refresh immédiat départ (${stopId}):`, err.message);
              });
            }
          });
        }
      }

      if (msg.type === "unsubscribe_departures") {
        console.log(`   🔕 Désabonnement départs`);
        if (ws.departureSubscription) {
          removeStopInterest(ws.departureSubscription.stopIds);
          delete ws.departureSubscription;
        }
      }
      // Gestion de l'abonnement complet à une station (Toutes les lignes)
      if (msg.type === "subscribe_station") {
        const { stopIds } = msg.data;
        if (stopIds && stopIds.length > 0) {
          if (ws.stationSubscription) {
            removeStopInterest(ws.stationSubscription.stopIds);
          }
          console.log(`   🚉 Abonnement station globale: ${stopIds.length} arrets`);
          addStopInterest(stopIds);
          ws.stationSubscription = { stopIds };
          
          // Tenter un push immédiat depuis le cache
          pushCachedDepartures(ws);

          // Lancer un refresh immédiat uniquement si pas de cache, cache expiré (> 15s) ou provenant du prefetch global
          const now = Date.now();
          stopIds.forEach((stopId) => {
            const cached = cache.departures[stopId];
            if (!cached || (now - cached.timestamp > 15000) || cached.source === "global") {
              refreshStop(stopId).catch((err) => {
                console.error(`❌ Erreur refresh immédiat station (${stopId}):`, err.message);
              });
            }
          });
        }
      }

      if (msg.type === "unsubscribe_station") {
        console.log(`   📴 Désabonnement station globale`);
        if (ws.stationSubscription) {
          removeStopInterest(ws.stationSubscription.stopIds);
          delete ws.stationSubscription;
        }
      }
    } catch (e) {
      // Message non-JSON ignoré
    }
  });

  ws.on("close", () => {
    const ts = new Date().toLocaleTimeString("fr-FR", { timeZone: "Europe/Paris" });
    console.log(`🔌 [${ts}] Client déconnecté. Restant: ${wss.clients.size}`);
    if (ws.pushTimeout) {
      clearTimeout(ws.pushTimeout);
    }
    if (ws.departureSubscription) {
      removeStopInterest(ws.departureSubscription.stopIds);
    }
    if (ws.stationSubscription) {
      removeStopInterest(ws.stationSubscription.stopIds);
    }
  });

  ws.on("error", (error) => {
    console.error(`   ❌ Erreur WebSocket: ${error.message}`);
  });
});

// ============================================================
// Système de Cache et de Pré-chargement en arrière-plan
// ============================================================

// ============================================================
// Cache et logique d'actualisation (Global Rail & On-Demand Bus)
// ============================================================

function updateCache(stopId, departures) {
  cache.departures[stopId] = {
    data: departures,
    timestamp: Date.now(),
    source: "on-demand"
  };

  console.log(`   💾 [Cache] Mis à jour pour ${stopId} (${departures.length} départs)`);

  // Si c'est un stop_area, on extrait et met également à jour le cache des stop_point individuels
  if (stopId.startsWith("stop_area:") && departures && departures.length > 0) {
    const grouped = {};
    for (const dep of departures) {
      const spId = dep.stop_point?.id;
      if (spId) {
        if (!grouped[spId]) grouped[spId] = [];
        grouped[spId].push(dep);
      }
    }
    for (const [spId, deps] of Object.entries(grouped)) {
      cache.departures[spId] = {
        data: deps,
        timestamp: Date.now(),
        source: "on-demand"
      };
    }
  }

  // Push immédiat aux abonnés WebSocket concernés (débatté pour regrouper par station)
  wss.clients.forEach((client) => {
    if (client.readyState === WebSocket.OPEN) {
      if (client.departureSubscription && client.departureSubscription.stopIds.includes(stopId)) {
        schedulePushDepartures(client);
      } else if (client.stationSubscription && client.stationSubscription.stopIds.includes(stopId)) {
        schedulePushDepartures(client);
      }
    }
  });
}

// Ingestion globale des départs récupérés via les requêtes généralisées
function ingestGlobalDepartures(departures) {
  if (!departures || departures.length === 0) return;

  const departuresByStop = {};

  for (const dep of departures) {
    const spId = dep.stop_point?.id;
    const saId = dep.stop_point?.stop_area?.id;

    if (spId) {
      if (!departuresByStop[spId]) departuresByStop[spId] = [];
      departuresByStop[spId].push(dep);
    }
    if (saId) {
      if (!departuresByStop[saId]) departuresByStop[saId] = [];
      departuresByStop[saId].push(dep);
    }
  }

  const now = Date.now();
  let updatedCount = 0;

  for (const [stopId, deps] of Object.entries(departuresByStop)) {
    // Si on a déjà un cache complet (on-demand) récent (moins de 20 secondes), on ne l'écrase pas avec du global partiel !
    const existing = cache.departures[stopId];
    if (existing && existing.source === "on-demand" && (now - existing.timestamp < 20000)) {
      continue;
    }

    cache.departures[stopId] = {
      data: deps,
      timestamp: now,
      source: "global"
    };
    updatedCount++;

    // Notification immédiate des abonnés WebSocket concernés (débatté pour regrouper par station)
    wss.clients.forEach((client) => {
      if (client.readyState === WebSocket.OPEN) {
        if (client.departureSubscription && client.departureSubscription.stopIds.includes(stopId)) {
          schedulePushDepartures(client);
        } else if (client.stationSubscription && client.stationSubscription.stopIds.includes(stopId)) {
          schedulePushDepartures(client);
        }
      }
    });
  }

  console.log(`   💾 [Global Ingest] Mis à jour de la base de cache pour ${updatedCount} arrêt(s) (${departures.length} départs traités)`);
}

// Fonction de récupération des horaires pour un mode physique spécifique (requête globale)
async function fetchGlobalDeparturesForMode(mode, count = 1000) {
  try {
    const url = `${NAVITIA_BASE}/physical_modes/${mode}/departures?count=${count}`;
    console.log(`   🌍 [Navitia Global] Récupération départs pour ${mode} (count: ${count})...`);
    const data = await navitiaFetch(url);
    if (data && data.departures) {
      ingestGlobalDepartures(data.departures);
    }
  } catch (err) {
    console.error(`❌ [Global Fetch Error] Erreur sur ${mode}:`, err.message);
  }
}

// Récupère globalement les horaires de tous les modes ferrés d'IDF
async function refreshAllGlobalRailDepartures() {
  const timestamp = new Date().toLocaleTimeString("fr-FR", { timeZone: "Europe/Paris" });
  console.log(`\n🔄 [${timestamp}] [Global Rail Refresh] Lancement des requêtes généralisées...`);

  // Requêtes en parallèle via la queue
  const modes = [
    { id: "physical_mode:Metro", count: 1000 },
    { id: "physical_mode:RapidTransit", count: 800 },
    { id: "physical_mode:LocalTrain", count: 800 },
    { id: "physical_mode:Tramway", count: 500 }
  ];

  const promises = modes.map((m) => fetchGlobalDeparturesForMode(m.id, m.count));
  await Promise.all(promises);
}

async function refreshStop(stopId) {
  if (stopId.includes("stop_area:") && stopId.includes(":C")) {
    return;
  }
  
  try {
    const endpoint = stopId.includes("stop_point") ? "stop_points" : "stop_areas";
    const url = `${NAVITIA_BASE}/${endpoint}/${stopId}/departures?count=1000`;
    
    console.log(`   🌍 [Navitia On-Demand] Requête départs pour ${stopId}`);
    const data = await navitiaFetch(url);
    if (data && data.departures) {
      updateCache(stopId, data.departures);
    }
  } catch (err) {
    if ((err.message.includes("404") || err.message.includes("unknown_object")) && !stopId.includes("stop_point")) {
      try {
        const retryId = stopId.startsWith("stop_point:") ? stopId : `stop_point:${stopId}`;
        const url = `${NAVITIA_BASE}/stop_points/${retryId}/departures?count=1000`;
        console.log(`   🌍 [Navitia Retry] Requête départs pour ${retryId}`);
        const data = await navitiaFetch(url);
        if (data && data.departures) {
          updateCache(stopId, data.departures);
          return;
        }
      } catch (retryErr) {
        // Ignorer
      }
    }
    updateCache(stopId, []);
  }
}

// Boucle d'actualisation des arrêts actifs (uniquement si le cache a expiré de plus de 20s)
async function refreshActiveStops() {
  const activeIds = Array.from(activeStopCounts.keys());
  if (activeIds.length === 0) return;

  const now = Date.now();
  // Filtrer pour ne rafraîchir que les arrêts dont le cache a expiré (> 20 secondes) ou provient du prefetch global
  // Cela évite de ré-interroger les gares ferrées qui ont déjà été rafraîchies par la boucle globale
  const expiredActiveIds = activeIds.filter((id) => {
    const cached = cache.departures[id];
    return !cached || (now - cached.timestamp > 20000) || cached.source === "global";
  });

  if (expiredActiveIds.length === 0) return;

  const timestamp = new Date().toLocaleTimeString("fr-FR", { timeZone: "Europe/Paris" });
  console.log(`\n🔄 [${timestamp}] [Active Refresh Loop] Rafraîchissement on-demand pour ${expiredActiveIds.length} arrêt(s) actif(s)...`);

  // Lancer toutes les requêtes en parallèle via la queue à concurrence limitée
  const promises = expiredActiveIds.map((id) =>
    refreshStop(id).catch((err) => {
      console.error(`❌ [Active Refresh] Erreur rafraîchissement ${id}:`, err.message);
    })
  );

  await Promise.all(promises);
}

// ============================================================
// Helper : Push débatté (debounced) depuis le cache vers un client
// ============================================================
function schedulePushDepartures(ws) {
  if (ws.pushTimeout) {
    clearTimeout(ws.pushTimeout);
  }
  ws.pushTimeout = setTimeout(() => {
    pushCachedDepartures(ws);
    delete ws.pushTimeout;
  }, 300); // 300ms de debounce pour accumuler les rafraîchissements
}

// ============================================================
// Helper : Push depuis le cache vers un client
// ============================================================
function pushCachedDepartures(ws) {
  if (!ws.departureSubscription && !ws.stationSubscription) return;

  let allDepartures = [];
  
  if (ws.departureSubscription) {
    const { stopIds, line, direction } = ws.departureSubscription;
    for (const stopId of stopIds) {
      const cached = cache.departures[stopId];
      if (cached && cached.data) {
        allDepartures = allDepartures.concat(cached.data);
      }
    }
    
    if (allDepartures.length > 0) {
      // Filtrer pour ne garder que la bonne ligne/direction
      allDepartures = allDepartures.filter((d) => {
        const dLine = d.display_informations?.label || d.display_informations?.code;
        const dDir = d.display_informations?.direction || "";
        if (dLine !== line) return false;
        if (!dDir.includes(direction) && !direction.includes(dDir)) return false;
        return true;
      });
    }
  } else if (ws.stationSubscription) {
    const { stopIds } = ws.stationSubscription;
    for (const stopId of stopIds) {
      const cached = cache.departures[stopId];
      if (cached && cached.data) {
        allDepartures = allDepartures.concat(cached.data);
      }
    }
  }

  if (allDepartures.length === 0) return;

  // Déduplication par clé unique (ligne - direction - heure)
  const seen = new Set();
  const uniqueDepartures = [];
  for (const dep of allDepartures) {
    const time = dep.stop_date_time?.departure_date_time;
    const lineLabel = dep.display_informations?.label || dep.display_informations?.code || "";
    const direction = dep.display_informations?.direction || "";
    const key = `${lineLabel}-${direction}-${time}`;
    if (!seen.has(key)) {
      seen.add(key);
      uniqueDepartures.push(dep);
    }
  }

  // Trier par heure de départ
  uniqueDepartures.sort((a, b) => {
    const tA = a.stop_date_time?.departure_date_time || "";
    const tB = b.stop_date_time?.departure_date_time || "";
    return tA.localeCompare(tB);
  });

  // Envoyer au client
  if (ws.readyState === WebSocket.OPEN) {
    ws.send(
      JSON.stringify({
        type: ws.stationSubscription ? "station_update" : "departure_update",
        timestamp: new Date().toISOString(),
        data: { departures: uniqueDepartures },
      })
    );
  }
}

// ============================================================
// REST Endpoints (toujours disponibles)
// ============================================================

// GET /api/logs — Obtenir les logs du serveur en mémoire
app.get("/api/logs", (req, res) => {
  res.json({ logs: serverLogs });
});

// GET /api/health — Santé du serveur
app.get("/api/health", (req, res) => {
  res.json({
    status: "ok",
    timestamp: new Date().toISOString(),
    connectedClients: wss.clients.size,
    lastUpdate: cache.lastFullUpdate || "pas encore",
    cacheAge: cache.traffic.timestamp
      ? Math.round((Date.now() - cache.traffic.timestamp) / 1000) + "s"
      : "empty",
    trafficInterval: TRAFFIC_REFRESH_INTERVAL_MS / 1000 + "s",
    activeRefreshInterval: ACTIVE_REFRESH_INTERVAL_MS / 1000 + "s",
  });
});

// GET /api/departures/:stationId — Prochains départs (Service à la demande ou cache)
app.get("/api/departures/:stationId", async (req, res) => {
  try {
    let stationId = decodeURIComponent(req.params.stationId);

    // Normalisation ID
    if (stationId.includes("stop_area")) {
      if (!stationId.startsWith("stop_area:")) stationId = `stop_area:${stationId}`;
    } else {
      if (!stationId.startsWith("stop_point:")) stationId = `stop_point:${stationId}`;
    }

    // Bloquer les requêtes sur les zones d'arrêt logiques IDFM
    if (stationId.includes("stop_area:") && stationId.includes(":C")) {
      return res.json({ departures: [] });
    }

    const cached = cache.departures[stationId];
    const now = Date.now();
    const isForce = req.query.force === "true";
    const isExpired = !cached || (now - cached.timestamp > 20000) || cached.source === "global";

    if (isForce || !cached) {
      // Pas de cache du tout, ou actualisation forcée : requête bloquante
      console.log(`   📡 [REST Fetch] Requête bloquante pour ${stationId}...`);
      await refreshStop(stationId);
    } else if (isExpired) {
      // Cache existant mais expiré ou global partiel : renvoi immédiat du cache + rafraîchissement asynchrone en arrière-plan
      console.log(`   📡 [REST Fetch] Servir cache (${cached.source}) pour ${stationId} + rafraîchissement en arrière-plan`);
      refreshStop(stationId).catch((err) => {
        console.error(`❌ Erreur refresh arrière-plan REST (${stationId}):`, err.message);
      });
    }

    // Servir du cache
    const updatedCached = cache.departures[stationId];
    if (updatedCached) {
      const ageSec = Math.round((Date.now() - updatedCached.timestamp) / 1000);
      console.log(`   💾 Départs pour ${stationId} servis (âge: ${ageSec}s)`);
      
      // Dédupliquer avant de renvoyer
      const seen = new Set();
      const uniqueDeps = [];
      for (const dep of updatedCached.data) {
        const time = dep.stop_date_time?.departure_date_time;
        const lineLabel = dep.display_informations?.label || dep.display_informations?.code || "";
        const direction = dep.display_informations?.direction || "";
        const key = `${lineLabel}-${direction}-${time}`;
        if (!seen.has(key)) {
          seen.add(key);
          uniqueDeps.push(dep);
        }
      }
      return res.json({ departures: uniqueDeps });
    }

    console.log(`   ⚠️ Départs pour ${stationId} non trouvés (vide)`);
    res.json({ departures: [] });
  } catch (error) {
    console.error("❌ Departures error:", error.message);
    res.status(500).json({ error: error.message });
  }
});

// GET /api/traffic — Infos trafic (depuis le cache)
app.get("/api/traffic", (req, res) => {
  if (cache.traffic.data) {
    console.log("   💾 Trafic servi depuis le cache");
    return res.json(cache.traffic.data);
  }
  res.status(503).json({ error: "Données pas encore disponibles, premier refresh en cours..." });
});

// GET /api/itinerary — Recherche d'itinéraire
app.get("/api/itinerary", async (req, res) => {
  try {
    const { from, to, datetime, datetime_represents, count, depth } = req.query;

    if (!from || !to) {
      return res.status(400).json({ error: "Paramètres 'from' et 'to' requis" });
    }

    const params = new URLSearchParams();
    params.set("from", from);
    params.set("to", to);
    if (datetime) params.set("datetime", datetime);
    if (datetime_represents) params.set("datetime_represents", datetime_represents);
    params.set("count", count || "5");
    params.set("depth", depth || "3");

    const url = `${NAVITIA_BASE}/journeys?${params.toString()}`;

    const data = await navitiaFetch(url);
    res.json(data);
  } catch (error) {
    console.error("❌ Itinerary error:", error.message);
    res.status(500).json({ error: error.message });
  }
});

// ============================================================
// Catch-all : route non trouvée
// ============================================================
app.use((req, res) => {
  res.status(404).json({ error: "Not Found" });
});

// ============================================================
// Démarrage
// ============================================================
server.listen(PORT, "0.0.0.0", () => {
  console.log(`\n🚀 FlowServer démarré !`);
  console.log(`   🌐 Local:    http://localhost:${PORT}`);
  console.log(`   📱 Réseau:   http://10.5.16.29:${PORT}`);
  console.log(`   🔌 WebSocket: ws://10.5.16.29:${PORT}`);
  console.log(`   ⏱  Refresh:  Perturbations toutes les ${TRAFFIC_REFRESH_INTERVAL_MS / 1000}s, Rail global toutes les 30s, Départs actifs toutes les ${ACTIVE_REFRESH_INTERVAL_MS / 1000}s`);
  console.log(`   📡 Endpoints REST:`);
  console.log(`      GET /api/health`);
  console.log(`      GET /api/departures/:stationId`);
  console.log(`      GET /api/traffic`);
  console.log(`      GET /api/itinerary?from=...&to=...`);
  console.log(`   🔑 API Key: ${IDFM_API_KEY.slice(0, 6)}...${IDFM_API_KEY.slice(-4)}\n`);

  // Charger le cache persistant
  loadPersistentCache();

  // Premier fetch immédiat au démarrage (perturbations + départs globaux)
  console.log(`🔄 Premier fetch des perturbations...`);
  autoRefresh();

  console.log(`🔄 Premier fetch des horaires ferroviaires globaux...`);
  refreshAllGlobalRailDepartures();

  // Boucle de mise à jour des perturbations (trafic global)
  setInterval(autoRefresh, TRAFFIC_REFRESH_INTERVAL_MS);

  // Boucle d'actualisation des départs ferroviaires globaux toutes les 30 secondes
  setInterval(refreshAllGlobalRailDepartures, 30 * 1000);

  // Boucle d'actualisation des départs pour les abonnements WebSocket actifs (on-demand bus)
  setInterval(refreshActiveStops, ACTIVE_REFRESH_INTERVAL_MS);

  // Boucle de sauvegarde automatique du cache sur le disque toutes les 10 minutes
  setInterval(savePersistentCache, 10 * 60 * 1000);
});

// Sauvegarde lors de la fermeture propre du serveur
process.on("SIGINT", () => {
  console.log("\n🛑 Fermeture du serveur détectée (SIGINT). Sauvegarde du cache...");
  savePersistentCache();
  process.exit(0);
});

process.on("SIGTERM", () => {
  console.log("\n🛑 Fermeture du serveur détectée (SIGTERM). Sauvegarde du cache...");
  savePersistentCache();
  process.exit(0);
});
