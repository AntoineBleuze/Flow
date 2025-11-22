import SwiftUI
import Combine

struct ContentView: View {
    // TabView gère son propre état de sélection, mais on peut l'initialiser si besoin
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Onglet 1: Explore (Carte)
            AppMapView()
                .ignoresSafeArea(edges: .top) // La carte prend tout l'écran (sauf la TabBar en bas)
                .tabItem {
                    Image(systemName: "map")
                    Text("Explore")
                }
                .tag(0)
            
            // Onglet 2: Trafic
            NavigationView {
                TrafficViewContent()
                    .navigationTitle("Trafic")
            }
            .tabItem {
                Image(systemName: "tram.fill")
                Text("Trafic")
            }
            .tag(1)
            
            // Onglet 3: Favoris
            NavigationView {
                FavoritesViewContent()
                    .navigationTitle("Favoris")
            }
            .tabItem {
                Image(systemName: "star.fill")
                Text("Favoris")
            }
            .tag(2)
            
            // Onglet 4: Recherche
            NavigationView {
                SearchView()
                    .navigationTitle("Recherche")
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Recherche")
            }
            .tag(3)
        }
        // On peut appliquer une couleur d'accentuation si désiré, mais l'exemple semble standard
        .accentColor(.blue)
        .onReceive(NotificationCenter.default.publisher(for: .triggerItinerary)) { _ in
            selectedTab = 3 // Switch to Search tab
        }
    }
}

// --- COMPOSANTS DE CONTENU (Adaptés pour être dans une NavigationView) ---

struct TrafficViewContent: View {
    @StateObject var service = TrafficService()
    
    enum StatusFilter: String, CaseIterable, Identifiable {
        case all = "Tout"
        case interrupted = "Interruptions"
        case disrupted = "Perturbations"
        case works = "Travaux"
        case information = "Informations"
        
        var id: String { rawValue }
        
        var matchingStatus: LineStatus? {
            switch self {
            case .all: return nil
            case .interrupted: return .interrupted
            case .disrupted: return .disrupted
            case .works: return .works
            case .information: return .information
            }
        }
    }
    
    @State private var selectedFilter: StatusFilter = .all
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header avec bouton de rafraîchissement et heure de dernière mise à jour
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        if let lastUpdate = service.lastUpdateTime {
                            let formatter = DateFormatter()
                            let _ = (formatter.dateFormat = "HH:mm")
                            Text("Dernière mise à jour: \(formatter.string(from: lastUpdate))")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        } else {
                            Text("Chargement...")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        service.refresh()
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: "arrow.clockwise")
                                .rotationEffect(.degrees(service.isRefreshing ? 360 : 0))
                                .animation(service.isRefreshing ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default, value: service.isRefreshing)
                            Text("Rafraîchir")
                                .font(.subheadline)
                        }
                        .foregroundColor(.blue)
                    }
                    .disabled(service.isRefreshing)
                }
                .padding(.horizontal)
                .padding(.top, 8)
                
                // Status Filter Picker
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(StatusFilter.allCases) { filter in
                            Button(action: {
                                selectedFilter = filter
                            }) {
                                Text(filter.rawValue)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                    .foregroundColor(selectedFilter == filter ? .white : .primary)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(
                                        Capsule()
                                            .fill(selectedFilter == filter ? Color.gray : Color(UIColor.secondarySystemGroupedBackground))
                                    )
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Filtered Lines by Status
                ForEach(TransportType.allCases) { type in
                    // Filter lines based on selected status filter
                    let filteredLines = service.lines.filter { line in
                        // Filter by status
                        if selectedFilter == .all {
                            return line.type == type
                        } else {
                            return line.type == type && line.status == selectedFilter.matchingStatus
                        }
                    }
                    
                    if !filteredLines.isEmpty {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(type.rawValue.uppercased())
                                .font(.caption).bold()
                                .foregroundColor(.secondary)
                                .padding(.leading, 20)
                            
                            ForEach(filteredLines) { line in
                                NavigationLink(destination: TrafficDetailView(line: line)) {
                                    HStack {
                                        LineIcon(line: line)
                                        VStack(alignment: .leading) {
                                            Text(line.status.description)
                                                .font(.subheadline).bold()
                                                .foregroundColor(line.status.color)
                                            if let msg = line.message {
                                                Text(msg).font(.caption).foregroundColor(.secondary)
                                                    .lineLimit(1)
                                            }
                                        }
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                            .font(.caption)
                                    }
                                    .padding()
                                    .background(Color(UIColor.systemBackground)) // Fond standard
                                    .cornerRadius(10)
                                    .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                                    .padding(.horizontal)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
            }
            .padding(.vertical)
        }
        .background(Color(UIColor.systemGroupedBackground)) // Fond de liste standard
    }
}

struct SearchViewContent: View {
    @State private var txt = ""
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass").foregroundColor(.gray)
                TextField("Station, ligne, adresse...", text: $txt)
            }
            .padding(10)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
            .padding()
            
            Spacer()
            
            Text("Recherchez un itinéraire ou un arrêt")
                .foregroundColor(.secondary)
            
            Spacer()
        }
    }
}

struct FavoritesViewContent: View {
    @ObservedObject var favoritesService = FavoritesService.shared
    @StateObject var mapData = MapDataService.shared
    
    var body: some View {
        ScrollView {
            if favoritesService.favoriteStationIds.isEmpty {
                VStack(spacing: 20) {
                    Image(systemName: "star.slash")
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                    Text("Aucun favori pour le moment")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text("Ajoutez des stations depuis la carte pour les voir ici.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(.top, 50)
            } else {
                VStack(spacing: 15) {
                    ForEach(Array(favoritesService.favoriteStationIds), id: \.self) { stationId in
                        if let station = mapData.visibleStations.first(where: { $0.id == stationId }) ?? 
                                         mapData.getAllStationsSync().first(where: { $0.id == stationId }) {
                            NavigationLink(destination: StationDetailSheet(station: station)) {
                                FavoriteStationRow(station: station)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .padding(.top)
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
    }
}

struct FavoriteStationRow: View {
    let station: Station
    @State private var nextDepartures: [String] = []
    @State private var isLoading = true
    
    var body: some View {
        HStack {
            // Icone Type
            TransportTypeIcon(type: station.mainType)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                Text(station.name)
                    .font(.headline)
                
                if isLoading {
                    Text("Chargement...")
                        .font(.caption)
                        .foregroundColor(.secondary)
                } else if nextDepartures.isEmpty {
                    Text("Aucun départ proche")
                        .font(.caption)
                        .foregroundColor(.secondary)
                } else {
                    Text("Prochains: " + nextDepartures.joined(separator: ", "))
                        .font(.subheadline)
                        .foregroundColor(.green)
                        .lineLimit(1)
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .font(.caption)
        }
        .padding()
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(12)
        .padding(.horizontal)
        .onAppear {
            loadPreview()
        }
    }
    
    private func loadPreview() {
        // Chargement léger pour l'aperçu (juste les 2 prochains départs tout confondu)
        let stopIds = station.platforms.map { $0.id }
        guard let firstId = stopIds.first else { return }
        
        // On prend juste le premier arrêt pour l'aperçu rapide pour éviter de spammer l'API
        // Idéalement il faudrait une requête agrégée ou stocker le dernier état
        IDFMService.shared.fetchDepartures(for: firstId)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in isLoading = false },
                  receiveValue: { deps in
                let sorted = deps.sorted { $0.stopDateTime.departureDateTime < $1.stopDateTime.departureDateTime }
                self.nextDepartures = sorted.prefix(2).compactMap { dep in
                    let dateStr = dep.stopDateTime.departureDateTime
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyyMMdd'T'HHmmss"
                    if let date = formatter.date(from: dateStr) {
                        let diff = Int(date.timeIntervalSinceNow / 60)
                        if diff <= 0 { return "Maintenant" }
                        return "\(diff) min"
                    }
                    return nil
                }
            })
            .store(in: &cancellables)
    }
    
    @State private var cancellables = Set<AnyCancellable>()
}

// Helper pour l'icone (si pas déjà existant)
struct TransportTypeIcon: View {
    let type: TransportType
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.gray.opacity(0.2))
            
            switch type {
            case .metro: Image(systemName: "m.circle.fill").foregroundColor(.blue)
            case .rer: Image(systemName: "r.circle.fill").foregroundColor(.red)
            case .train, .transilien: Image(systemName: "train.side.front.car").foregroundColor(.orange)
            case .tram: Image(systemName: "tram").foregroundColor(.purple)
            case .bus: Image(systemName: "bus").foregroundColor(.cyan)
            }
        }
    }
}


#Preview(){
    ContentView()
}
