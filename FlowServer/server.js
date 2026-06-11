// ============================================================
// FlowServer — Backend proxy pour l'app Flow (IDFM/Navitia)
// Avec WebSocket push + auto-refresh toutes les minutes
// ============================================================

require("dotenv").config();
const express = require("express");
const cors = require("cors");
const http = require("http");
const { WebSocketServer, WebSocket } = require("ws");

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
const REFRESH_INTERVAL_MS = 30 * 1000; // 30 secondes

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

const recentlyRequestedStops = new Map(); // stopId -> timestamp
const API_DELAY_MS = parseInt(process.env.API_DELAY_MS || "200", 10);

// Chargement des arrêts de stops.json
const fs = require("fs");
const path = require("path");

let railwayStops = [];
let busStops = [];

try {
  const stopsPath = path.join(__dirname, "stops.json");
  if (fs.existsSync(stopsPath)) {
    const stopsData = JSON.parse(fs.readFileSync(stopsPath, "utf8"));
    railwayStops = stopsData.railway || [];
    busStops = stopsData.bus || [];
    console.log(`   ✅ stops.json chargé : ${railwayStops.length} ferroviaires et ${busStops.length} bus.`);
  } else {
    console.warn("   ⚠️ stops.json introuvable. Aucun arrêt ne sera pré-chargé.");
  }
} catch (err) {
  console.error("   ❌ Erreur lors du chargement de stops.json :", err.message);
}

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
// ============================================================
const navitiaQueue = [];
let isProcessingQueue = false;

async function processNavitiaQueue() {
  if (isProcessingQueue || navitiaQueue.length === 0) return;
  isProcessingQueue = true;

  const { url, resolve, reject } = navitiaQueue.shift();

  try {
    const timestamp = new Date().toLocaleTimeString("fr-FR", { timeZone: "Europe/Paris" });
    const response = await fetch(url, {
      headers: { apiKey: IDFM_API_KEY },
    });

    if (!response.ok) {
      const text = await response.text();
      // Si on se prend un 429 quand même, on réinjecte au début de la queue avec un délai de 2 secondes
      if (response.status === 429) {
        console.warn(`[${timestamp}] ⚠️ 429 détecté, attente prolongée (2s)...`);
        navitiaQueue.unshift({ url, resolve, reject });
        setTimeout(() => {
          isProcessingQueue = false;
          processNavitiaQueue();
        }, 2000);
        return;
      }
      throw new Error(`Navitia ${response.status}: ${text}`);
    }

    const data = await response.json();
    resolve(data);

    // Petit délai configurable après un appel réussi
    setTimeout(() => {
      isProcessingQueue = false;
      processNavitiaQueue();
    }, API_DELAY_MS);
  } catch (err) {
    reject(err);
    // En cas d'erreur (autre que 429), on passe à la suite après un petit délai
    setTimeout(() => {
      isProcessingQueue = false;
      processNavitiaQueue();
    }, Math.max(100, API_DELAY_MS / 2));
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
  console.log(`\n🔄 [${timestamp}] Auto-refresh des données...`);

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

    // Les départs sont désormais gérés séparément par le worker de pré-chargement.
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
          // Gérer le changement d'abonnement (désabonner l'ancien si existe)
          if (ws.departureSubscription) {
            removeStopInterest(ws.departureSubscription.stopIds);
          }

          console.log(
            `   🔔 Abonnement départs: ${stopIds.length} arrets, Ligne ${line}, Dir ${direction}`
          );
          addStopInterest(stopIds);
          ws.departureSubscription = { stopIds, line, direction };

          // Tenter un push immédiat si données en cache, sinon fetch
          // On peut lancer un refresh partiel ou juste check cache
          pushCachedDepartures(ws);

          // Si pas de données, on pourrait trigger un fetch spécifique, 
          // mais pour l'instant on attend le prochain autoRefresh (recommandé pour "Global Loop")
          // Optionnel: refreshActiveDepartures() si cache vide? Non, attendons 30s max.
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
          pushCachedDepartures(ws);
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

function updateCache(stopId, departures) {
  cache.departures[stopId] = {
    data: departures,
    timestamp: Date.now()
  };

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
        timestamp: Date.now()
      };
    }
  }

  // Push immédiat aux abonnés WebSocket concernés
  wss.clients.forEach((client) => {
    if (client.readyState === WebSocket.OPEN && client.departureSubscription) {
      const sub = client.departureSubscription;
      if (sub.stopIds.includes(stopId)) {
        pushCachedDepartures(client);
      }
    }
  });
}

let railwayIndex = 0;
let busIndex = 0;
let intercalateCount = 0;

async function getNextStopToFetch() {
  const now = Date.now();
  
  // 1. Priorité aux arrêts actifs (WebSocket)
  for (const stopId of activeStopCounts.keys()) {
    const cached = cache.departures[stopId];
    if (!cached || (now - cached.timestamp > 60000)) {
      return stopId;
    }
  }
  
  // 2. Priorité aux arrêts récemment demandés (REST)
  for (const [stopId, timestamp] of recentlyRequestedStops.entries()) {
    if (now - timestamp > 300000) {
      recentlyRequestedStops.delete(stopId);
      continue;
    }
    const cached = cache.departures[stopId];
    if (!cached || (now - cached.timestamp > 60000)) {
      return stopId;
    }
  }
  
  // 3. Boucle générale (Ratio 4 railway pour 1 bus)
  if (railwayStops.length === 0 && busStops.length === 0) {
    return null;
  }
  
  if (railwayStops.length > 0 && (intercalateCount < 4 || busStops.length === 0)) {
    intercalateCount++;
    const stopId = railwayStops[railwayIndex];
    railwayIndex = (railwayIndex + 1) % railwayStops.length;
    return stopId;
  } else if (busStops.length > 0) {
    intercalateCount = 0;
    const stopId = busStops[busIndex];
    busIndex = (busIndex + 1) % busStops.length;
    return stopId;
  }
  return null;
}

async function refreshStop(stopId) {
  if (stopId.includes("stop_area:") && stopId.includes(":C")) {
    return;
  }
  
  try {
    let data;
    const endpoint = stopId.includes("stop_point") ? "stop_points" : "stop_areas";
    const url = `${NAVITIA_BASE}/${endpoint}/${stopId}/departures?count=150`;
    
    data = await navitiaFetch(url);
    if (data && data.departures) {
      const isActive = activeStopCounts.has(stopId) || recentlyRequestedStops.has(stopId);
      if (isActive) {
        console.log(`   🌍 [Priority Fetch] Pré-chargé départs pour l'arrêt actif ${stopId} (${data.departures.length} départs)`);
      }
      updateCache(stopId, data.departures);
    }
  } catch (err) {
    if ((err.message.includes("404") || err.message.includes("unknown_object")) && !stopId.includes("stop_point")) {
      try {
        const retryId = stopId.startsWith("stop_point:") ? stopId : `stop_point:${stopId}`;
        const url = `${NAVITIA_BASE}/stop_points/${retryId}/departures?count=150`;
        const data = await navitiaFetch(url);
        if (data && data.departures) {
          const isActive = activeStopCounts.has(stopId) || recentlyRequestedStops.has(stopId);
          if (isActive) {
            console.log(`   🌍 [Priority Fetch Retry] Pré-chargé départs pour l'arrêt actif ${stopId} (${data.departures.length} départs)`);
          }
          updateCache(stopId, data.departures);
          return;
        }
      } catch (retryErr) {
        // Enregistrer cache vide
      }
    }
    updateCache(stopId, []);
  }
}

async function startPrefetchLoop() {
  console.log("🚀 Lancement du worker de pré-chargement en tâche de fond...");
  while (true) {
    try {
      const stopId = await getNextStopToFetch();
      if (stopId) {
        await refreshStop(stopId);
      }
    } catch (err) {
      console.error("❌ Erreur dans le cycle principal de pré-chargement:", err.message);
    }
    await new Promise((resolve) => setTimeout(resolve, 50));
  }
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
    // Pas de filtrage par ligne/direction pour l'abonnement station complet
  }

  if (allDepartures.length === 0) return;

  // Trier par heure de départ
  allDepartures.sort((a, b) => {
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
        data: { departures: allDepartures },
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
    refreshInterval: REFRESH_INTERVAL_MS / 1000 + "s",
  });
});

// GET /api/departures/:stationId — Prochains départs (Service depuis le cache uniquement)
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

    // Enregistrer comme récemment demandé pour actualisation prioritaire
    recentlyRequestedStops.set(stationId, Date.now());

    // Servir uniquement depuis le cache
    const cached = cache.departures[stationId];
    if (cached) {
      const ageSec = Math.round((Date.now() - cached.timestamp) / 1000);
      console.log(`   💾 Départs pour ${stationId} servis depuis le cache (âge: ${ageSec}s)`);
      return res.json({ departures: cached.data });
    }

    console.log(`   ⚠️ Départs pour ${stationId} non trouvés en cache (vide)`);
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
  console.log(`   ⏱  Refresh:  toutes les ${REFRESH_INTERVAL_MS / 1000}s`);
  console.log(`   📡 Endpoints REST:`);
  console.log(`      GET /api/health`);
  console.log(`      GET /api/departures/:stationId`);
  console.log(`      GET /api/traffic`);
  console.log(`      GET /api/itinerary?from=...&to=...`);
  console.log(`   🔑 API Key: ${IDFM_API_KEY.slice(0, 6)}...${IDFM_API_KEY.slice(-4)}\n`);

  // Premier fetch immédiat au démarrage
  console.log(`🔄 Premier fetch des données...`);
  autoRefresh();

  // Puis toutes les minutes
  setInterval(autoRefresh, REFRESH_INTERVAL_MS);

  // Lancement du cycle de pré-chargement continu en arrière-plan
  startPrefetchLoop();
});
