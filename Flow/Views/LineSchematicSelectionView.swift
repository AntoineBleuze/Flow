import SwiftUI

struct LineSchematicSelectionView: View {
    @StateObject var service = TrafficService() // We reuse the same service to get the lines
    @State private var selectedType: TransportType? = .metro
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Transport Type Selector (Segmented)
                Picker("Type de transport", selection: $selectedType) {
                    ForEach(TransportType.allCases) { type in
                        if type != .bus { // Only show major lines for now as per Traffic page
                            Text(type.rawValue).tag(type as TransportType?)
                        }
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                if let type = selectedType {
                    let filteredLines = service.lines.filter { $0.type == type }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text(type.rawValue.uppercased())
                            .font(.caption).bold()
                            .foregroundColor(.secondary)
                            .padding(.leading, 20)
                        
                        let isIPad = horizontalSizeClass == .regular
                        LazyVGrid(
                            columns: [
                                GridItem(.adaptive(minimum: isIPad ? 100 : 80, maximum: isIPad ? 130 : 100), spacing: isIPad ? 20 : 16)
                            ], spacing: isIPad ? 20 : 16
                        ) {
                            ForEach(filteredLines) { line in
                                NavigationLink(destination: LineSchematicPlanView(line: line)) {
                                    LineIcon(line: line, size: isIPad ? 70 : 55)
                                        .frame(width: isIPad ? 100 : 80, height: isIPad ? 100 : 80)
                                }
                                .buttonStyle(.glass)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.vertical)
        }
        .background {
            ZStack {
                ShaderAnimationView(isLoading: true)
                (colorScheme == .dark ? Color.black.opacity(0.2) : Color.white.opacity(0.15))
                    .glassEffect(.ultraThin)
            }
            .ignoresSafeArea()
        }
        .navigationTitle("Plans")
    }
}

#Preview {
    LineSchematicSelectionView()
}
