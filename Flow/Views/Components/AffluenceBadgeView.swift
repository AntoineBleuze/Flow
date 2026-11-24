import SwiftUI

// MARK: - Affluence Badge (Pour la liste des itinéraires / JourneyRow)
struct AffluenceBadgeView: View {
    let level: CrowdLevel
    @Environment(\.colorScheme) var colorScheme

    public init(level: CrowdLevel) {
        self.level = level
    }

    public var body: some View {
        HStack(spacing: 4) {
            Image(systemName: level.icon)
                .font(.system(size: 10, weight: .bold))

            Text(level.title)
                .font(.system(size: 11, weight: .semibold, design: .rounded))
        }
        .foregroundColor(badgeColor)
        .padding(.horizontal, 7)
        .padding(.vertical, 3)
        .background(
            Capsule()
                .fill(badgeColor.opacity(colorScheme == .dark ? 0.16 : 0.10))
        )
        .overlay(
            Capsule()
                .stroke(badgeColor.opacity(colorScheme == .dark ? 0.35 : 0.25), lineWidth: 0.8)
        )
    }

    private var badgeColor: Color {
        switch level {
        case .low:
            return LiquidGlassTheme.liveGreen(for: colorScheme)
        case .moderate:
            return LiquidGlassTheme.statusWorksColor(for: colorScheme)
        case .high:
            return colorScheme == .dark ? Color(hex: "FF9F0A") : Color(hex: "D96B00")
        case .veryHigh:
            return colorScheme == .dark ? Color(hex: "FF453A") : Color(hex: "D70015")
        }
    }
}

// MARK: - Affluence Section Card (Pour le détail de l'itinéraire / SectionDetailView)
struct AffluenceSectionCard: View {
    let affluence: EstimatedAffluence
    @Environment(\.colorScheme) var colorScheme

    public init(affluence: EstimatedAffluence) {
        self.affluence = affluence
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Header
            HStack(spacing: 6) {
                Image(systemName: affluence.level.icon)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(accentColor)

                Text("Affluence estimée")
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(.secondary)

                Spacer()

                Text(affluence.level.title)
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundColor(accentColor)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(
                        Capsule()
                            .fill(accentColor.opacity(colorScheme == .dark ? 0.18 : 0.12))
                    )
            }

            // Jauge à 4 segments
            HStack(spacing: 4) {
                ForEach(1...4, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 2)
                        .fill(index <= affluence.level.segmentsCount ? accentColor : (colorScheme == .dark ? Color.white.opacity(0.12) : Color.black.opacity(0.08)))
                        .frame(height: 4)
                        .animation(.easeInOut(duration: 0.2), value: affluence.level)
                }
            }

            // Explication contextuelle
            Text(affluence.detail)
                .font(.system(size: 11, weight: .regular, design: .rounded))
                .foregroundColor(.secondary)
                .lineLimit(2)
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(colorScheme == .dark ? Color.white.opacity(0.04) : Color.black.opacity(0.03))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    colorScheme == .dark ? Color.white.opacity(0.08) : Color.black.opacity(0.06),
                    lineWidth: 1
                )
        )
    }

    private var accentColor: Color {
        switch affluence.level {
        case .low:
            return LiquidGlassTheme.liveGreen(for: colorScheme)
        case .moderate:
            return LiquidGlassTheme.statusWorksColor(for: colorScheme)
        case .high:
            return colorScheme == .dark ? Color(hex: "FF9F0A") : Color(hex: "D96B00")
        case .veryHigh:
            return colorScheme == .dark ? Color(hex: "FF453A") : Color(hex: "D70015")
        }
    }
}

// MARK: - Mini pastille d'affluence pour arrêt intermédiaire
struct StopAffluenceIndicator: View {
    let level: CrowdLevel
    @Environment(\.colorScheme) var colorScheme

    public init(level: CrowdLevel) {
        self.level = level
    }

    public var body: some View {
        Circle()
            .fill(dotColor)
            .frame(width: 6, height: 6)
            .help(level.title)
    }

    private var dotColor: Color {
        switch level {
        case .low:
            return LiquidGlassTheme.liveGreen(for: colorScheme)
        case .moderate:
            return LiquidGlassTheme.statusWorksColor(for: colorScheme)
        case .high:
            return colorScheme == .dark ? Color(hex: "FF9F0A") : Color(hex: "D96B00")
        case .veryHigh:
            return colorScheme == .dark ? Color(hex: "FF453A") : Color(hex: "D70015")
        }
    }
}
