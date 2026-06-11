import SwiftUI

/// Panel d'étapes de navigation affiché en overlay sur la carte
struct NavigationStepsPanel: View {
    @ObservedObject var navigationManager = NavigationManager.shared
    @Binding var showFullSteps: Bool
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        GlassEffectContainer {
            VStack(spacing: 0) {
                // Handle bar
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 40, height: 5)
                    .padding(.top, 8)

                // Current instruction
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(
                            navigationManager.currentInstruction.isEmpty
                                ? "Navigation en cours..."
                                : navigationManager.currentInstruction
                        )
                        .font(.headline)
                        .lineLimit(2)

                        if let journey = navigationManager.currentJourney,
                            let destination = journey.sections?.last?.to?.name
                        {
                            Text("Vers \(destination)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }

                    Spacer()

                    // Stop button
                    Button(action: {
                        navigationManager.stopNavigation()
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.red)
                            .frame(width: 44, height: 44)
                    }
                    .buttonStyle(.plain)
                    .glassEffect(.regular.interactive(), in: .circle)
                }
                .padding()

                // Progress indicator (line icons)
                if let journey = navigationManager.currentJourney,
                    let sections = journey.sections
                {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 4) {
                            ForEach(sections.filter { $0.type == "public_transport" }) { section in
                                if let display = section.display_informations {
                                    Circle()
                                        .fill(Color(hex: display.color ?? "CCCCCC"))
                                        .frame(width: 24, height: 24)
                                        .overlay(
                                            Text(display.code ?? display.label ?? "?")
                                                .font(.system(size: 10, weight: .bold))
                                                .foregroundColor(
                                                    Color(hex: display.text_color ?? "FFFFFF")
                                                )
                                        )
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 8)
                }

                // Expanded: Show all steps
                if showFullSteps {
                    Divider()

                    if let journey = navigationManager.currentJourney,
                        let sections = journey.sections
                    {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 12) {
                                ForEach(Array(sections.enumerated()), id: \.element.id) {
                                    index, section in
                                    NavigationStepRow(section: section, stepNumber: index + 1)
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                    showFullSteps.toggle()
                }
            }
        }
    }
}

/// Row pour une étape individuelle de navigation
struct NavigationStepRow: View {
    let section: ItinerarySection
    let stepNumber: Int

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Step indicator
            ZStack {
                Circle()
                    .fill(stepColor)
                    .frame(width: 28, height: 28)

                if section.type == "public_transport" {
                    if let display = section.display_informations {
                        Text(display.code ?? display.label ?? "\(stepNumber)")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.white)
                    }
                } else {
                    Image(systemName: stepIcon)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                }
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(stepTitle)
                    .font(.subheadline)
                    .fontWeight(.medium)

                Text(stepSubtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)

                if let duration = section.duration {
                    Text("\(duration / 60) min")
                        .font(.caption2)
                        .foregroundColor(.blue)
                }
            }

            Spacer()
        }
    }

    private var stepColor: Color {
        switch section.type {
        case "public_transport":
            if let color = section.display_informations?.color {
                return Color(hex: color)
            }
            return .blue
        case "street_network", "transfer":
            return .gray
        default:
            return .secondary
        }
    }

    private var stepIcon: String {
        switch section.type {
        case "street_network":
            return "figure.walk"
        case "transfer":
            return "arrow.triangle.2.circlepath"
        case "waiting":
            return "clock"
        default:
            return "map"
        }
    }

    private var stepTitle: String {
        switch section.type {
        case "public_transport":
            if let display = section.display_informations {
                return
                    "\(display.commercial_mode ?? "Transport") \(display.code ?? display.label ?? "")"
            }
            return "Transport"
        case "street_network":
            return "Marcher"
        case "transfer":
            return "Correspondance"
        default:
            return section.type
        }
    }

    private var stepSubtitle: String {
        switch section.type {
        case "public_transport":
            if let from = section.from?.name, let to = section.to?.name {
                return "\(from) → \(to)"
            }
            return section.display_informations?.direction ?? ""
        case "street_network", "transfer":
            if let to = section.to?.name {
                return "Vers \(to)"
            }
            return ""
        default:
            return ""
        }
    }
}

#Preview {
    NavigationStepsPanel(showFullSteps: .constant(true))
        .padding()
        .onAppear {
            NavigationManager.shared.startNavigation(journey: PreviewMockData.mockJourney)
            NavigationManager.shared.currentInstruction = "Prendre le métro 1"
        }
}



