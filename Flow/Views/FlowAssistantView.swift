import Combine
import CoreHaptics
import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

// MARK: - Message Model

struct AssistantChatMessage: Identifiable, Equatable {
    let id = UUID()
    let isUser: Bool
    var text: String
    let date = Date()
    var isStreaming: Bool = false
    var journeys: [Journey] = []
    var destinationName: String? = nil

    static func == (lhs: AssistantChatMessage, rhs: AssistantChatMessage) -> Bool {
        lhs.id == rhs.id &&
        lhs.isUser == rhs.isUser &&
        lhs.text == rhs.text &&
        lhs.date == rhs.date &&
        lhs.isStreaming == rhs.isStreaming &&
        lhs.destinationName == rhs.destinationName &&
        lhs.journeys.map(\.id) == rhs.journeys.map(\.id)
    }
}

// MARK: - Haptic Engine for AI Thinking State

@MainActor
private final class AIThinkingHapticController: ObservableObject {
    private var loopTask: Task<Void, Never>?
    private var engine: CHHapticEngine?
    #if canImport(UIKit)
    private let rigidGenerator = UIImpactFeedbackGenerator(style: .rigid)
    private let softGenerator = UIImpactFeedbackGenerator(style: .soft)
    private let notificationGenerator = UINotificationFeedbackGenerator()
    #endif

    init() {
        prepareEngineIfSupported()
    }

    private func prepareEngineIfSupported() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        do {
            let hapticEngine = try CHHapticEngine()
            hapticEngine.playsHapticsOnly = true
            hapticEngine.isAutoShutdownEnabled = true
            hapticEngine.stoppedHandler = { [weak self] _ in
                Task { @MainActor in
                    self?.engine = nil
                }
            }
            hapticEngine.resetHandler = { [weak self] in
                Task { @MainActor in
                    try? self?.engine?.start()
                }
            }
            try hapticEngine.start()
            self.engine = hapticEngine
        } catch {
            self.engine = nil
        }
    }

    func startThinkingLoop(isStreamingProvider: @escaping @MainActor () -> Bool) {
        stopLoop(playCompletion: false)

        #if canImport(UIKit)
        rigidGenerator.prepare()
        softGenerator.prepare()
        notificationGenerator.prepare()
        #endif

        if engine == nil {
            prepareEngineIfSupported()
        } else {
            try? engine?.start()
        }

        loopTask = Task { [weak self] in
            while let self = self, !Task.isCancelled {
                let isStreaming = isStreamingProvider()
                self.playThinkingDoublePulse(isStreaming: isStreaming)

                let intervalNs: UInt64 = isStreaming ? 340_000_000 : 260_000_000
                try? await Task.sleep(nanoseconds: intervalNs)
            }
        }
    }

    func stopLoop(playCompletion: Bool, isError: Bool = false) {
        loopTask?.cancel()
        loopTask = nil

        guard playCompletion else { return }
        #if canImport(UIKit)
        notificationGenerator.prepare()
        notificationGenerator.notificationOccurred(isError ? .error : .success)
        #endif
    }

    private func playThinkingDoublePulse(isStreaming: Bool) {
        let primaryIntensity: Float = isStreaming ? 0.38 : 0.55
        let secondaryIntensity: Float = isStreaming ? 0.22 : 0.30

        if let engine = engine, CHHapticEngine.capabilitiesForHardware().supportsHaptics {
            do {
                let first = CHHapticEvent(
                    eventType: .hapticTransient,
                    parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: primaryIntensity),
                        CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.72)
                    ],
                    relativeTime: 0
                )
                let second = CHHapticEvent(
                    eventType: .hapticTransient,
                    parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: secondaryIntensity),
                        CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.38)
                    ],
                    relativeTime: 0.085
                )
                let pattern = try CHHapticPattern(events: [first, second], parameters: [])
                let player = try engine.makePlayer(with: pattern)
                try player.start(atTime: CHHapticTimeImmediate)
                return
            } catch {
                // Fallback sur UIImpactFeedbackGenerator si le moteur CoreHaptics a été suspendu
            }
        }

        #if canImport(UIKit)
        rigidGenerator.impactOccurred(intensity: CGFloat(primaryIntensity))
        rigidGenerator.prepare()
        Task { [weak self] in
            try? await Task.sleep(nanoseconds: 85_000_000)
            guard let self = self, !Task.isCancelled else { return }
            self.softGenerator.impactOccurred(intensity: CGFloat(secondaryIntensity))
            self.softGenerator.prepare()
        }
        #endif
    }

    deinit {
        loopTask?.cancel()
    }
}

// MARK: - Animated MeshGradient Components

private struct AnimatedAIMeshGradient: View {
    var speedMultiplier: Double = 1.0
    var palette: [Color]? = nil
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        TimelineView(.animation(minimumInterval: 1.0 / 30.0)) { context in
            let t = context.date.timeIntervalSinceReferenceDate * speedMultiplier
            MeshGradient(
                width: 3,
                height: 3,
                points: animatedPoints(at: t),
                colors: palette ?? defaultPalette,
                smoothsColors: true
            )
        }
    }

    private var defaultPalette: [Color] {
        if colorScheme == .dark {
            return [
                Color(hex: "0A2463"), Color(hex: "3E1F92"), Color(hex: "007AFF"),
                Color(hex: "00B4D8"), Color(hex: "6C4BF4"), Color(hex: "AF52DE"),
                Color(hex: "14213D"), Color(hex: "2563EB"), Color(hex: "4CC9F0")
            ]
        } else {
            return [
                Color(hex: "38BDF8"), Color(hex: "818CF8"), Color(hex: "C084FC"),
                Color(hex: "007AFF"), Color(hex: "6366F1"), Color(hex: "EC4899"),
                Color(hex: "22D3EE"), Color(hex: "3B82F6"), Color(hex: "A855F7")
            ]
        }
    }

    private func animatedPoints(at t: TimeInterval) -> [SIMD2<Float>] {
        let p1 = Float(0.5 + 0.24 * sin(t * 1.1))
        let p3 = Float(0.5 + 0.24 * cos(t * 0.9))
        let p4x = Float(0.5 + 0.22 * sin(t * 1.35 + 0.6))
        let p4y = Float(0.5 + 0.22 * cos(t * 1.15 + 1.2))
        let p5 = Float(0.5 + 0.24 * sin(t * 0.85 + 2.1))
        let p7 = Float(0.5 + 0.24 * cos(t * 1.25 + 0.4))

        return [
            SIMD2(0.0, 0.0), SIMD2(p1, 0.0), SIMD2(1.0, 0.0),
            SIMD2(0.0, p3), SIMD2(p4x, p4y), SIMD2(1.0, p5),
            SIMD2(0.0, 1.0), SIMD2(p7, 1.0), SIMD2(1.0, 1.0)
        ]
    }
}

private struct AnimatedAIMeshStroke: View {
    var cornerRadius: CGFloat
    var lineWidth: CGFloat
    var speedMultiplier: Double

    var body: some View {
        AnimatedAIMeshGradient(speedMultiplier: speedMultiplier)
            .mask {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .strokeBorder(lineWidth: lineWidth)
            }
            .allowsHitTesting(false)
    }
}

private struct AnimatedAIMeshBackground: View {
    var isGenerating: Bool
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        AnimatedAIMeshGradient(speedMultiplier: isGenerating ? 1.85 : 0.65)
            .opacity(
                isGenerating
                    ? (colorScheme == .dark ? 0.30 : 0.24)
                    : (colorScheme == .dark ? 0.16 : 0.12)
            )
            .blur(radius: 32)
            .ignoresSafeArea()
            .allowsHitTesting(false)
            .animation(.easeInOut(duration: 0.45), value: isGenerating)
    }
}

private struct AnimatedAIMeshOrb: View {
    var size: CGFloat = 38
    var isActive: Bool = false

    var body: some View {
        ZStack {
            AnimatedAIMeshGradient(speedMultiplier: isActive ? 2.4 : 0.9)
                .frame(width: size, height: size)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .strokeBorder(Color.white.opacity(0.45), lineWidth: 1)
                )
                .shadow(
                    color: Color(hex: "6366F1").opacity(isActive ? 0.55 : 0.28),
                    radius: isActive ? 10 : 5,
                    x: 0,
                    y: 2
                )

            Image(systemName: "sparkles")
                .font(.system(size: size * 0.44, weight: .bold))
                .foregroundStyle(.white)
                .symbolEffect(.variableColor.iterative, isActive: isActive)
        }
        .scaleEffect(isActive ? 1.06 : 1.0)
        .animation(.spring(response: 0.4, dampingFraction: 0.7), value: isActive)
    }
}

// MARK: - Thinking Card with Moving MeshGradient Border

private struct LiquidThinkingMeshCard: View {
    let statusText: String
    @Environment(\.colorScheme) private var colorScheme
    @State private var pulseDot: Bool = false

    var body: some View {
        HStack(spacing: 12) {
            AnimatedAIMeshOrb(size: 30, isActive: true)

            VStack(alignment: .leading, spacing: 2) {
                Text(statusText)
                    .font(.system(size: 13.5, weight: .semibold, design: .rounded))
                    .foregroundStyle(.primary)
                    .lineLimit(2)
                    .contentTransition(.interpolate)

                HStack(spacing: 4) {
                    ForEach(0..<3, id: \.self) { index in
                        Circle()
                            .fill(Color.blue.opacity(0.75))
                            .frame(width: 5, height: 5)
                            .scaleEffect(pulseDot ? 1.0 : 0.45)
                            .opacity(pulseDot ? 1.0 : 0.35)
                            .animation(
                                .easeInOut(duration: 0.5)
                                    .repeatForever(autoreverses: true)
                                    .delay(Double(index) * 0.14),
                                value: pulseDot
                            )
                    }
                    Text("Traitement on-device & réseau temps réel")
                        .font(.system(size: 11, weight: .medium, design: .rounded))
                        .foregroundStyle(.secondary)
                        .padding(.leading, 4)
                }
            }

            Spacer(minLength: 4)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.primary.opacity(colorScheme == .dark ? 0.09 : 0.05))
                .overlay {
                    AnimatedAIMeshStroke(
                        cornerRadius: 20,
                        lineWidth: 1.6,
                        speedMultiplier: 2.2
                    )
                    .opacity(0.85)
                }
        }
        .onAppear {
            pulseDot = true
        }
    }
}

// MARK: - Inline Interactive Itinerary Card

private struct AIInlineItineraryCard: View {
    let journeys: [Journey]
    let destinationName: String?
    let onPreviewOnMap: (Journey) -> Void
    let onStartNavigation: (Journey) -> Void

    @State private var selectedIndex: Int = 0
    @Environment(\.colorScheme) private var colorScheme

    private var activeJourney: Journey {
        journeys[min(selectedIndex, max(0, journeys.count - 1))]
    }

    private var durationMinutes: Int {
        max(1, (activeJourney.duration ?? 600) / 60)
    }

    private var transferCount: Int {
        activeJourney.nb_transfers ?? 0
    }

    private var walkingMinutes: Int {
        guard let sections = activeJourney.sections else { return 0 }
        let seconds = sections
            .filter { $0.type == "street_network" || $0.mode == "walking" || $0.type == "transfer" }
            .reduce(0) { $0 + ($1.duration ?? 0) }
        return seconds / 60
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if journeys.count > 1 {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 6) {
                        ForEach(journeys.indices, id: \.self) { idx in
                            let isSelected = idx == selectedIndex
                            let dur = max(1, (journeys[idx].duration ?? 600) / 60)
                            Button {
                                #if canImport(UIKit)
                                UISelectionFeedbackGenerator().selectionChanged()
                                #endif
                                withAnimation(.spring(response: 0.28, dampingFraction: 0.8)) {
                                    selectedIndex = idx
                                }
                            } label: {
                                Text("Option \(idx + 1) • \(dur) min")
                                    .font(.system(size: 11.5, weight: .bold, design: .rounded))
                                    .foregroundStyle(isSelected ? .white : .primary)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(
                                        Capsule()
                                            .fill(isSelected ? Color.blue : Color.primary.opacity(0.08))
                                    )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }

            // Metrics & Time Header
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 2) {
                    if let dep = activeJourney.departure_date_time,
                       let arr = activeJourney.arrival_date_time {
                        HStack(spacing: 5) {
                            Text(DateFormat.formatTime(from: dep))
                                .font(.system(size: 17, weight: .bold, design: .rounded))
                            Image(systemName: "arrow.right")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundStyle(.secondary)
                            Text(DateFormat.formatTime(from: arr))
                                .font(.system(size: 17, weight: .bold, design: .rounded))
                        }
                    } else {
                        Text(destinationName.map { "Vers \($0)" } ?? "Itinéraire calculé")
                            .font(.system(size: 15, weight: .bold, design: .rounded))
                            .lineLimit(1)
                    }

                    HStack(spacing: 8) {
                        Label(
                            transferCount == 0 ? "Direct" : "\(transferCount) corresp.",
                            systemImage: "arrow.triangle.branch"
                        )
                        if walkingMinutes > 0 {
                            Label("\(walkingMinutes) min marche", systemImage: "figure.walk")
                        }
                    }
                    .font(.system(size: 11.5, weight: .medium, design: .rounded))
                    .foregroundStyle(.secondary)
                }

                Spacer()

                Text("~\(durationMinutes) min")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 11)
                    .padding(.vertical, 6)
                    .background(
                        Capsule().fill(
                            LinearGradient(
                                colors: [Color(hex: "007AFF"), Color(hex: "5856D6")],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    )
            }

            // Étapes clés détaillées (icône + station de départ → arrivée + direction)
            if let sections = activeJourney.sections {
                let transitSections = sections.filter {
                    $0.type == "public_transport" || (($0.mode == "walking" || $0.type == "street_network") && ($0.duration ?? 0) >= 120)
                }

                if !transitSections.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(Array(transitSections.prefix(4).enumerated()), id: \.offset) { _, section in
                            let secMin = max(1, (section.duration ?? 60) / 60)
                            if section.type == "public_transport", let info = section.display_informations {
                                HStack(spacing: 8) {
                                    LineIcon(
                                        type: info.transportType,
                                        lineId: info.code ?? info.label ?? "?",
                                        size: 22,
                                        customColor: Color(hex: info.color ?? "0078D7")
                                    )

                                    VStack(alignment: .leading, spacing: 1) {
                                        Text("\(section.from?.name ?? "Départ") → \(section.to?.name ?? "Arrivée")")
                                            .font(.system(size: 12.5, weight: .semibold, design: .rounded))
                                            .foregroundStyle(.primary)
                                            .lineLimit(1)

                                        if let dir = info.direction, !dir.isEmpty {
                                            Text("Dir. \(dir)")
                                                .font(.system(size: 11, weight: .medium, design: .rounded))
                                                .foregroundStyle(.secondary)
                                                .lineLimit(1)
                                        }
                                    }

                                    Spacer(minLength: 4)

                                    Text("\(secMin) min")
                                        .font(.system(size: 11, weight: .bold, design: .rounded))
                                        .foregroundStyle(.secondary)
                                }
                            } else {
                                HStack(spacing: 8) {
                                    Image(systemName: "figure.walk")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundStyle(.secondary)
                                        .frame(width: 22, height: 22)
                                        .background(Color.primary.opacity(0.06), in: Circle())

                                    Text("Marche vers \(section.to?.name ?? "destination")")
                                        .font(.system(size: 12, weight: .medium, design: .rounded))
                                        .foregroundStyle(.secondary)
                                        .lineLimit(1)

                                    Spacer(minLength: 4)

                                    Text("\(secMin) min")
                                        .font(.system(size: 11, weight: .semibold, design: .rounded))
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                    }
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                            .fill(Color.primary.opacity(colorScheme == .dark ? 0.06 : 0.04))
                    )
                }
            }

            // Direct Map & Navigation Actions
            GlassEffectContainer(spacing: 10) {
                HStack(spacing: 10) {
                    Button {
                        #if canImport(UIKit)
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        #endif
                        onPreviewOnMap(activeJourney)
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "map.fill")
                                .font(.system(size: 12.5, weight: .bold))
                            Text("Voir sur la carte")
                                .font(.system(size: 13, weight: .bold, design: .rounded))
                        }
                        .foregroundStyle(.primary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                    }
                    .buttonStyle(.plain)
                    .glassEffect(.regular.interactive(), in: Capsule())

                    Button {
                        #if canImport(UIKit)
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        #endif
                        onStartNavigation(activeJourney)
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "location.north.fill")
                                .font(.system(size: 12.5, weight: .bold))
                            Text("Démarrer")
                                .font(.system(size: 13, weight: .bold, design: .rounded))
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(
                            Capsule().fill(
                                LinearGradient(
                                    colors: [Color(hex: "007AFF"), Color(hex: "4F46E5")],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                        )
                    }
                    .buttonStyle(.plain)
                    .glassEffect(.regular.interactive(), in: Capsule())
                }
            }
        }
        .padding(14)
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.primary.opacity(colorScheme == .dark ? 0.10 : 0.06))
                .overlay {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .strokeBorder(FlowTheme.specularBorder(for: colorScheme), lineWidth: 1)
                }
        }
    }
}

// MARK: - Main FlowAssistantView

@available(iOS 26.0, *)
public struct FlowAssistantView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var coordinator: NavigationCoordinator
    @StateObject private var aiService = FlowAIService.shared
    @StateObject private var voiceManager = VoiceDictationManager.shared
    @StateObject private var hapticController = AIThinkingHapticController()

    @FocusState private var isInputFocused: Bool
    @State private var inputText: String = ""
    @State private var messages: [AssistantChatMessage] = [
        AssistantChatMessage(
            isUser: false,
            text: "Bonjour ! Je suis Flow IA, votre copilote Île-de-France.\n\nDemandez-moi un itinéraire en temps réel avec votre heure de départ ou d'arrivée, la meilleure sortie d'une station, l'état des ascenseurs ou les perturbations du trafic."
        )
    ]

    public init() {}

    public var body: some View {
        let isExtended = coordinator.aiSheetDetent == .large

        ZStack {
            // Fond opaque/givré uniquement lorsque la sheet est étendue à .large pour une lisibilité parfaite
            Group {
                Rectangle()
                    .fill(.regularMaterial)
                Rectangle()
                    .fill(Color(.systemBackground).opacity(colorScheme == .dark ? 0.72 : 0.78))
            }
            .opacity(isExtended ? 1.0 : 0.0)
            .ignoresSafeArea()
            .allowsHitTesting(false)
            .animation(.easeInOut(duration: 0.28), value: isExtended)

            // Fond MeshGradient fluide animé
            AnimatedAIMeshBackground(isGenerating: aiService.isGenerating)

            VStack(spacing: 0) {
                headerBar
                messagesScrollView
                floatingInputBar
            }
        }
        .scrollContentBackground(.hidden)
        .onAppear {
            LocationManager.shared.requestLocation()
        }
        .onDisappear {
            hapticController.stopLoop(playCompletion: false)
            if voiceManager.isRecording {
                voiceManager.stopRecording()
            }
        }
        .onChange(of: aiService.isStreamingText) { _, streaming in
            if streaming && coordinator.aiSheetDetent != .large {
                withAnimation(.spring(response: 0.42, dampingFraction: 0.84)) {
                    coordinator.aiSheetDetent = .large
                }
            }
        }
        .onChange(of: aiService.isGenerating) { _, generating in
            if generating {
                hapticController.startThinkingLoop {
                    aiService.isStreamingText
                }
            } else {
                hapticController.stopLoop(
                    playCompletion: true,
                    isError: aiService.lastError != nil
                )
                if messages.count > 1 && coordinator.aiSheetDetent != .large {
                    withAnimation(.spring(response: 0.42, dampingFraction: 0.84)) {
                        coordinator.aiSheetDetent = .large
                    }
                }
            }
        }
        .onChange(of: aiService.latestGeneratedJourneys.map(\.id)) { _, _ in
            attachGeneratedJourneysToLatestMessage()
        }
    }

    // MARK: - Header (Style LiquidGlassSheetHeader)

    private var headerBar: some View {
        HStack(alignment: .center, spacing: 12) {
            AnimatedAIMeshOrb(size: 40, isActive: aiService.isGenerating)

            VStack(alignment: .leading, spacing: 2) {
                Text("Flow IA")
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .foregroundStyle(.primary)

                Text(
                    aiService.activeToolStatus
                        ?? (aiService.isGenerating ? "Rédaction de la réponse..." : "Copilote IDFM • Temps réel")
                )
                .font(.system(size: 12, weight: .medium, design: .rounded))
                .foregroundStyle(aiService.isGenerating ? .blue : .secondary)
                .lineLimit(1)
                .contentTransition(.interpolate)
            }

            Spacer(minLength: 8)

            GlassEffectContainer(spacing: 10) {
                HStack(spacing: 10) {
                    Button {
                        #if canImport(UIKit)
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        #endif
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                            aiService.resetConversation()
                            messages = [
                                AssistantChatMessage(
                                    isUser: false,
                                    text: "Conversation réinitialisée. Où souhaitez-vous aller ?"
                                )
                            ]
                        }
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.primary)
                            .frame(width: 36, height: 36)
                    }
                    .buttonStyle(.plain)
                    .glassEffect(.regular.interactive(), in: Circle())
                    .disabled(aiService.isGenerating)
                    .accessibilityLabel("Réinitialiser la conversation")

                    Button {
                        #if canImport(UIKit)
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        #endif
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(.primary)
                            .frame(width: 36, height: 36)
                    }
                    .buttonStyle(.plain)
                    .glassEffect(.regular.interactive(), in: Circle())
                    .accessibilityLabel("Fermer Flow IA")
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .padding(.bottom, 10)
    }

    // MARK: - Messages List

    private var messagesScrollView: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(messages) { msg in
                        chatBubble(for: msg)
                            .id(msg.id)
                            .transition(
                                .asymmetric(
                                    insertion: .scale(scale: 0.94)
                                        .combined(with: .opacity)
                                        .combined(with: .offset(y: 12)),
                                    removal: .opacity
                                )
                            )
                    }

                    if aiService.isGenerating && (!aiService.isStreamingText || (messages.last?.isUser == false && messages.last?.text.isEmpty == true)) {
                        LiquidThinkingMeshCard(
                            statusText: aiService.activeToolStatus ?? "Flow IA réfléchit..."
                        )
                        .id("THINKING_CARD")
                        .transition(.scale(scale: 0.95).combined(with: .opacity))
                    }

                    Color.clear
                        .frame(height: 8)
                        .id("BOTTOM_ANCHOR")
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 16)
            }
            .scrollDismissesKeyboard(.interactively)
            .scrollContentBackground(.hidden)
            .onChange(of: messages.count) { _, _ in
                scrollToBottom(proxy: proxy, animated: true)
            }
            .onChange(of: messages.last?.text) { _, _ in
                scrollToBottom(proxy: proxy, animated: false)
            }
            .onChange(of: messages.last?.journeys.count) { _, _ in
                scrollToBottom(proxy: proxy, animated: true)
            }
            .onChange(of: aiService.isGenerating) { _, generating in
                if generating {
                    scrollToBottom(proxy: proxy, animated: true)
                } else {
                    scrollToBottom(proxy: proxy, animated: true)
                }
            }
        }
    }

    private func scrollToBottom(proxy: ScrollViewProxy, animated: Bool) {
        let targetId = AnyHashable("BOTTOM_ANCHOR")
        if animated {
            withAnimation(.spring(response: 0.36, dampingFraction: 0.82)) {
                proxy.scrollTo(targetId, anchor: .bottom)
            }
        } else {
            proxy.scrollTo(targetId, anchor: .bottom)
        }
    }

    // MARK: - Floating Liquid Glass Input Bar

    private var floatingInputBar: some View {
        let trimmedEmpty = inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty

        return HStack(spacing: 8) {
            TextField("Demandez un itinéraire, une sortie, le trafic...", text: $inputText, axis: .vertical)
                .font(.system(.body, design: .rounded))
                .focused($isInputFocused)
                .padding(.leading, 14)
                .padding(.vertical, 10)
                .lineLimit(1...4)
                .submitLabel(.send)
                .disabled(aiService.isGenerating)
                .onSubmit {
                    submitCurrentInput()
                }

            // Dictée vocale
            Button {
                #if canImport(UIKit)
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                #endif
                voiceManager.toggleRecording(
                    onUpdate: { transcript in
                        inputText = transcript
                    },
                    onFinished: { finalTranscript in
                        inputText = finalTranscript
                    }
                )
            } label: {
                Image(systemName: voiceManager.isRecording ? "waveform.circle.fill" : "mic.fill")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(voiceManager.isRecording ? .red : .secondary)
                    .frame(width: 34, height: 34)
                    .symbolEffect(.pulse, isActive: voiceManager.isRecording)
            }
            .buttonStyle(.plain)
            .disabled(aiService.isGenerating)
            .accessibilityLabel("Dictée vocale")

            // Bouton d'envoi animé avec MeshGradient
            Button {
                submitCurrentInput()
            } label: {
                ZStack {
                    if !trimmedEmpty && !aiService.isGenerating {
                        AnimatedAIMeshGradient(speedMultiplier: 1.5)
                            .clipShape(Circle())
                            .shadow(color: Color(hex: "6366F1").opacity(0.45), radius: 8, x: 0, y: 3)
                    } else {
                        Circle()
                            .fill(Color.primary.opacity(0.08))
                    }

                    Image(systemName: aiService.isGenerating ? "sparkles" : "arrow.up")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(
                            (trimmedEmpty && !aiService.isGenerating)
                                ? AnyShapeStyle(Color.secondary.opacity(0.45))
                                : AnyShapeStyle(Color.white)
                        )
                        .symbolEffect(.variableColor.iterative, isActive: aiService.isGenerating)
                }
                .frame(width: 38, height: 38)
            }
            .buttonStyle(.plain)
            .disabled(trimmedEmpty || aiService.isGenerating)
            .animation(.spring(response: 0.28, dampingFraction: 0.75), value: trimmedEmpty)
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 5)
        .glassEffect(.regular.interactive(), in: RoundedRectangle(cornerRadius: 26, style: .continuous))
        .overlay {
            if aiService.isGenerating || isInputFocused {
                AnimatedAIMeshStroke(
                    cornerRadius: 26,
                    lineWidth: aiService.isGenerating ? 1.6 : 1.0,
                    speedMultiplier: aiService.isGenerating ? 2.4 : 0.8
                )
                .opacity(aiService.isGenerating ? 0.85 : 0.45)
            }
        }
        .padding(.horizontal, 14)
        .padding(.top, 6)
        .padding(.bottom, 10)
    }

    // MARK: - Chat Bubble & Markdown Formatter

    private func renderFormattedMessage(_ text: String) -> AttributedString {
        if let attr = try? AttributedString(
            markdown: text,
            options: .init(interpretedSyntax: .inlineOnlyPreservingWhitespace)
        ) {
            let plain = String(attr.characters)
            if !plain.contains("**") {
                return attr
            }
        }
        return AttributedString(text.replacingOccurrences(of: "**", with: ""))
    }

    @ViewBuilder
    private func chatBubble(for message: AssistantChatMessage) -> some View {
        if message.isUser {
            HStack {
                Spacer(minLength: 44)
                Text(message.text)
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .lineSpacing(3)
                    .textSelection(.enabled)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 11)
                    .background {
                        AnimatedAIMeshGradient(
                            speedMultiplier: 0.7,
                            palette: [
                                Color(hex: "007AFF"), Color(hex: "3B82F6"), Color(hex: "6366F1"),
                                Color(hex: "2563EB"), Color(hex: "5856D6"), Color(hex: "7C3AED"),
                                Color(hex: "1D4ED8"), Color(hex: "4F46E5"), Color(hex: "8B5CF6")
                            ]
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .strokeBorder(Color.white.opacity(0.28), lineWidth: 1)
                        )
                    }
            }
        } else {
            VStack(alignment: .leading, spacing: 10) {
                if !message.text.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 6) {
                            AnimatedAIMeshOrb(
                                size: 18,
                                isActive: message.isStreaming && aiService.isGenerating
                            )
                            Text("Flow IA")
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .foregroundStyle(.secondary)
                        }

                        Text(renderFormattedMessage(message.text))
                            .font(.system(.body, design: .rounded))
                            .foregroundStyle(.primary)
                            .lineSpacing(3)
                            .textSelection(.enabled)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 12)
                    .background {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.primary.opacity(colorScheme == .dark ? 0.09 : 0.05))
                            .overlay {
                                if message.isStreaming && aiService.isGenerating {
                                    AnimatedAIMeshStroke(
                                        cornerRadius: 20,
                                        lineWidth: 1.2,
                                        speedMultiplier: 2.0
                                    )
                                    .opacity(0.65)
                                } else {
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .strokeBorder(FlowTheme.specularBorder(for: colorScheme), lineWidth: 0.9)
                                }
                            }
                    }
                    .padding(.trailing, 18)
                }

                if !message.journeys.isEmpty {
                    AIInlineItineraryCard(
                        journeys: message.journeys,
                        destinationName: message.destinationName,
                        onPreviewOnMap: { journey in
                            coordinator.showItineraryPreview(journey: journey)
                            coordinator.exploreSheetDetent = .medium
                            dismiss()
                        },
                        onStartNavigation: { journey in
                            coordinator.startNavigation(journey: journey)
                            dismiss()
                        }
                    )
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: - Actions & Logic

    private func submitCurrentInput() {
        let trimmed = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty, !aiService.isGenerating else { return }

        if voiceManager.isRecording {
            voiceManager.stopRecording()
        }
        isInputFocused = false

        #if canImport(UIKit)
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        #endif

        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
            inputText = ""
        }

        sendPrompt(trimmed)
    }

    private func sendPrompt(_ text: String) {
        let userMsg = AssistantChatMessage(isUser: true, text: text)
        let assistantMsg = AssistantChatMessage(isUser: false, text: "", isStreaming: true)

        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            messages.append(userMsg)
            messages.append(assistantMsg)
        }

        let targetId = assistantMsg.id

        Task {
            do {
                let stream = aiService.streamAssistant(prompt: text)
                for try await snapshot in stream {
                    await MainActor.run {
                        if let idx = messages.firstIndex(where: { $0.id == targetId }) {
                            messages[idx].text = snapshot
                            if !aiService.latestGeneratedJourneys.isEmpty {
                                messages[idx].journeys = aiService.latestGeneratedJourneys
                                messages[idx].destinationName = aiService.latestDestinationName
                            }
                        }
                    }
                }
                await MainActor.run {
                    if let idx = messages.firstIndex(where: { $0.id == targetId }) {
                        messages[idx].isStreaming = false
                        if !aiService.latestGeneratedJourneys.isEmpty {
                            messages[idx].journeys = aiService.latestGeneratedJourneys
                            messages[idx].destinationName = aiService.latestDestinationName
                        }
                        if messages[idx].text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                            messages[idx].text = "Voici le résultat trouvé."
                        }
                    }
                }
            } catch {
                await MainActor.run {
                    if let idx = messages.firstIndex(where: { $0.id == targetId }) {
                        messages[idx].text = "Désolé, une erreur est survenue : \(error.localizedDescription)"
                        messages[idx].isStreaming = false
                    }
                }
            }
        }
    }

    private func attachGeneratedJourneysToLatestMessage() {
        let generated = aiService.latestGeneratedJourneys
        guard !generated.isEmpty else { return }
        if let idx = messages.lastIndex(where: { !$0.isUser }) {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.82)) {
                messages[idx].journeys = generated
                messages[idx].destinationName = aiService.latestDestinationName
            }
        }
    }
}

#Preview("Flow IA — Light") {
    if #available(iOS 26.0, *) {
        FlowAssistantView()
            .environmentObject(NavigationCoordinator.shared)
            .preferredColorScheme(.light)
    }
}

#Preview("Flow IA — Dark") {
    if #available(iOS 26.0, *) {
        FlowAssistantView()
            .environmentObject(NavigationCoordinator.shared)
            .preferredColorScheme(.dark)
    }
}
