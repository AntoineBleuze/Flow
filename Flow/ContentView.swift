import SwiftUI

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
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(TransportType.allCases) { type in
                    let lines = service.lines.filter { $0.type == type }
                    if !lines.isEmpty {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(type.rawValue.uppercased())
                                .font(.caption).bold()
                                .foregroundColor(.secondary)
                                .padding(.leading, 20)
                            
                            ForEach(lines) { line in
                                NavigationLink(destination: TrafficDetailView(line: line)) {
                                    HStack {
                                        LineIcon(line: line)
                                        VStack(alignment: .leading) {
                                            Text(line.status.description)
                                                .font(.subheadline).bold()
                                                .foregroundColor(line.status == .normal ? .primary : .orange)
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
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                HStack {
                    Image(systemName: "house.fill")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .frame(width: 40, height: 40)
                        .background(Circle().fill(Color.blue.opacity(0.1)))
                    
                    VStack(alignment: .leading) {
                        Text("Maison").bold()
                        Text("Aucun incident").font(.caption).foregroundColor(.green)
                    }
                    Spacer()
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(15)
                .padding(.horizontal)
            }
            .padding(.top)
        }
    }
}


#Preview(){
    ContentView()
}
