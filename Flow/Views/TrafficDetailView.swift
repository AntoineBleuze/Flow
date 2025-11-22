import SwiftUI

struct TrafficDetailView: View {
    let line: TransportLine
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header avec l'icône et le statut
                HStack(spacing: 15) {
                    LineIcon(line: line)
                        .scaleEffect(1.5)
                    
                    VStack(alignment: .leading) {
                        Text("Ligne \(line.lineId)")
                            .font(.title).bold()
                        Text(line.status.description)
                            .font(.headline)
                            .foregroundColor(line.status.color)
                    }
                    Spacer()
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(15)
                
                // Section: En cours
                let activeInfos = line.trafficInfos.filter { $0.period == .active }
                if !activeInfos.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("En cours")
                            .font(.headline)
                            .padding(.bottom, 5)
                        
                        ForEach(activeInfos) { info in
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Image(systemName: info.severity.icon)
                                        .foregroundColor(info.severity.color)
                                    Text(info.title)
                                        .font(.subheadline).bold()
                                }
                                
                                Text(.init(info.message))
                                    .font(.body)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding()
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                        }
                    }
                } else if line.status == .normal {
                    Text("Aucun incident signalé pour le moment.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding()
                }
                
                // Section: À venir
                let futureInfos = line.trafficInfos.filter { $0.period == .future }
                if !futureInfos.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("À venir")
                            .font(.headline)
                            .padding(.top, 10)
                            .padding(.bottom, 5)
                        
                        ForEach(futureInfos) { info in
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Image(systemName: "calendar")
                                        .foregroundColor(.blue)
                                    Text(info.title)
                                        .font(.subheadline).bold()
                                }
                                
                                Text(.init(info.message))
                                    .font(.body)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding()
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Info Trafic")
        .navigationBarTitleDisplayMode(.inline)
    }
}
