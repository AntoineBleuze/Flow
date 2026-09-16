import Combine
import SwiftUI

public struct AssistantChatMessage: Identifiable, Equatable {
    public let id = UUID()
    public let isUser: Bool
    public var text: String
    public let date = Date()
    public var isStreaming: Bool = false
}

// MARK: - Animated Liquid Glow Aura

private struct LiquidAuraBackground: View {
    @State private var animateAura: Bool = false
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        ZStack {
            // Ambient Canvas
            if colorScheme == .dark {
                Color.black.ignoresSafeArea()
            } else {
                Color(uiColor: .systemGroupedBackground).ignoresSafeArea()
            }

            // Glowing Liquid Orbs
            GeometryReader { proxy in
                let size = proxy.size
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color.purple.opacity(colorScheme == .dark ? 0.35 : 0.20),
                                Color.blue.opacity(colorScheme == .dark ? 0.20 : 0.10),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 20,
                            endRadius: size.width * 0.45
                        )
                    )
                    .frame(width: size.width * 0.9, height: size.width * 0.9)
                    .offset(
                        x: animateAura ? size.width * 0.15 : -size.width * 0.15,
                        y: animateAura ? size.height * 0.05 : -size.height * 0.10
                    )
                    .blur(radius: 60)

                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color.cyan.opacity(colorScheme == .dark ? 0.25 : 0.15),
                                Color.indigo.opacity(colorScheme == .dark ? 0.25 : 0.10),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 30,
                            endRadius: size.width * 0.5
                        )
                    )
                    .frame(width: size.width * 0.85, height: size.width * 0.85)
                    .offset(
                        x: animateAura ? -size.width * 0.10 : size.width * 0.20,
                        y: animateAura ? size.height * 0.35 : size.height * 0.20
                    )
                    .blur(radius: 70)
            }
            .ignoresSafeArea()
            .onAppear {
                withAnimation(
                    .easeInOut(duration: 7.0)
                    .repeatForever(autoreverses: true)
                ) {
                    animateAura = true
                }
            }

            // Glass Overlay for diffusion
            Rectangle()
                .fill(.ultraThinMaterial)
                .opacity(colorScheme == .dark ? 0.45 : 0.70)
                .ignoresSafeArea()
        }
    }
}

// MARK: - Pulsing Thinking Indicator

private struct LiquidThinkingIndicator: View {
    @State private var phase: CGFloat = 0
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Circle()
                    .stroke(
                        AngularGradient(
                            gradient: Gradient(colors: [.blue, .purple, .pink, .cyan, .blue]),
                            center: .center,
                            angle: .degrees(phase)
                        ),
                        lineWidth: 2.2
                    )
                    .frame(width: 22, height: 22)

                Image(systemName: "sparkles")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.purple, .blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            }

            Text("Flow IA consulte les outils du réseau...")
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background {
            Capsule()
                .fill(.ultraThinMaterial)
                .overlay(
                    Capsule()
                        .strokeBorder(LiquidGlassTheme.specularBorder(for: colorScheme), lineWidth: 1)
                )
        }
        .clipShape(Capsule())
        .shadow(color: Color.purple.opacity(0.15), radius: 8, x: 0, y: 2)
        .onAppear {
            withAnimation(.linear(duration: 2.2).repeatForever(autoreverses: false)) {
                phase = 360
            }
        }
    }
}

// MARK: - Main FlowAssistantView

@available(iOS 27.0, *)
public struct FlowAssistantView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var coordinator: NavigationCoordinator
    @StateObject private var aiService = FlowAIService.shared

    @State private var inputText: String = ""
    @State private var isSendButtonHovered: Bool = false
    @State private var messages: [AssistantChatMessage] = [
        AssistantChatMessage(
            isUser: false,
            text: "Bonjour ! Je suis le copilote IA de Flow propulsé par Apple Foundation Model sur iOS 27.\n\nDemandez-moi un itinéraire depuis votre position, la meilleure sortie d'une station, l'état des ascenseurs ou les alertes trafic."
        )
    ]

    private let suggestions: [(title: String, icon: String, iconColor: Color, prompt: String)] = [
        ("Tour Eiffel", "figure.walk", .pink, "Quel itinéraire me recommandes-tu pour aller à Champ de Mars Tour Eiffel ?"),
        ("Sortie Saint-Lazare", "arrow.up.right.square.fill", .cyan, "Quelle sortie prendre à Saint-Lazare pour aller rue de Rome ?"),
        ("Ascenseurs Châtelet", "figure.roll", .green, "Est-ce que les ascenseurs fonctionnent à Châtelet pour un voyageur PMR ?"),
        ("Trafic Ligne 13", "tram.fill", .orange, "Quel est l'état du trafic en temps réel sur la ligne 13 ?"),
        ("Briefing du jour", "sun.horizon.fill", .yellow, "Donne-moi mon briefing de transport pour aujourd'hui avec mes favoris.")
    ]

    public init() {}

    public var body: some View {
        NavigationStack {
            ZStack {
                // 1. Futuristic Ambient Liquid Aura
                LiquidAuraBackground()

                // 2. Chat Contents
                VStack(spacing: 0) {
                    // Header Subtitle Badge
                    aiEngineBadge
                        .padding(.top, 4)
                        .padding(.bottom, 6)

                    // Quick Suggestion Chips
                    suggestionChipsBar

                    // Messages View
                    messagesScrollView

                    // Floating Liquid Glass Input Bar
                    floatingInputBar
                }
            }
            .navigationTitle("Copilote Flow")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.secondary)
                            .padding(7)
                            .background(.ultraThinMaterial, in: Circle())
                            .overlay(
                                Circle()
                                    .strokeBorder(LiquidGlassTheme.specularBorder(for: colorScheme), lineWidth: 0.8)
                            )
                    }
                    .buttonStyle(.liquidGlassInteractive)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        triggerHaptic(style: .light)
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                            aiService.resetConversation()
                            messages = [
                                AssistantChatMessage(
                                    isUser: false,
                                    text: "Conversation réinitialisée. En quoi puis-je vous aider ?"
                                )
                            ]
                        }
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.secondary)
                            .padding(7)
                            .background(.ultraThinMaterial, in: Circle())
                            .overlay(
                                Circle()
                                    .strokeBorder(LiquidGlassTheme.specularBorder(for: colorScheme), lineWidth: 0.8)
                            )
                    }
                    .buttonStyle(.liquidGlassInteractive)
                    .disabled(aiService.isGenerating)
                }
            }
        }
        .presentationBackground(.ultraThinMaterial)
        .presentationCornerRadius(LiquidGlassTheme.sheetCornerRadius)
        .presentationBackgroundInteraction(.enabled(upThrough: .medium))
        .onAppear {
            LocationManager.shared.requestLocation()
        }
    }

    // MARK: - Subviews

    private var aiEngineBadge: some View {
        HStack(spacing: 6) {
            Circle()
                .fill(Color.green)
                .frame(width: 7, height: 7)
                .shadow(color: Color.green.opacity(0.8), radius: 4)

            Text("Foundation Model iOS 27 • On-Device 100% Privé")
                .font(.system(size: 11, weight: .semibold, design: .rounded))
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 4)
        .background {
            Capsule()
                .fill(.ultraThinMaterial)
                .overlay(
                    Capsule()
                        .strokeBorder(LiquidGlassTheme.specularBorder(for: colorScheme), lineWidth: 0.8)
                )
        }
    }

    private var suggestionChipsBar: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(suggestions, id: \.title) { item in
                    Button {
                        triggerHaptic(style: .medium)
                        sendPrompt(item.prompt)
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: item.icon)
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(item.iconColor)

                            Text(item.title)
                                .font(.system(size: 13, weight: .semibold, design: .rounded))
                                .foregroundColor(.primary)
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 9)
                        .background {
                            Capsule()
                                .fill(.ultraThinMaterial)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(LiquidGlassTheme.specularBorder(for: colorScheme), lineWidth: 1)
                                )
                        }
                        .clipShape(Capsule())
                        .shadow(
                            color: colorScheme == .dark ? Color.black.opacity(0.3) : Color.black.opacity(0.04),
                            radius: 6,
                            x: 0,
                            y: 2
                        )
                    }
                    .buttonStyle(.liquidGlassInteractive)
                    .disabled(aiService.isGenerating)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
    }

    private var messagesScrollView: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(messages) { msg in
                        chatBubble(for: msg)
                            .id(msg.id)
                            .transition(
                                .asymmetric(
                                    insertion: .scale(scale: 0.90)
                                        .combined(with: .opacity)
                                        .combined(with: .offset(y: 15)),
                                    removal: .opacity
                                )
                            )
                    }

                    if aiService.isGenerating && messages.last?.isUser == true {
                        HStack {
                            LiquidThinkingIndicator()
                            Spacer()
                        }
                        .padding(.horizontal, 6)
                        .transition(.scale.combined(with: .opacity))
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 10)
                .padding(.bottom, 24)
            }
            .onChange(of: messages.count) {
                if let last = messages.last {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        proxy.scrollTo(last.id, anchor: .bottom)
                    }
                }
            }
            .onChange(of: messages.last?.text) {
                if let last = messages.last {
                    proxy.scrollTo(last.id, anchor: .bottom)
                }
            }
        }
    }

    private var floatingInputBar: some View {
        HStack(spacing: 10) {
            TextField("Demandez un itinéraire, une sortie, un trafic...", text: $inputText, axis: .vertical)
                .font(.system(.body, design: .rounded))
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .lineLimit(1...4)
                .disabled(aiService.isGenerating)
                .onSubmit {
                    submitCurrentInput()
                }

            // Animated Liquid Glass Send Button
            Button {
                submitCurrentInput()
            } label: {
                ZStack {
                    if !inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [Color(hex: "007AFF"), Color(hex: "AF52DE")],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .shadow(color: Color.purple.opacity(0.5), radius: 8, x: 0, y: 3)
                    } else {
                        Circle()
                            .fill(Color.primary.opacity(0.08))
                    }

                    Image(systemName: "arrow.up")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(
                            inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || aiService.isGenerating
                                ? .secondary.opacity(0.4)
                                : .white
                        )
                }
                .frame(width: 38, height: 38)
            }
            .buttonStyle(.liquidGlassInteractive)
            .disabled(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || aiService.isGenerating)
            .scaleEffect(isSendButtonHovered ? 1.05 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: inputText)
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 6)
        .background {
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 26, style: .continuous)
                        .strokeBorder(
                            LiquidGlassTheme.specularBorder(for: colorScheme),
                            lineWidth: 1.2
                        )
                )
        }
        .clipShape(RoundedRectangle(cornerRadius: 26, style: .continuous))
        .shadow(
            color: colorScheme == .dark ? Color.black.opacity(0.5) : Color.black.opacity(0.10),
            radius: 16,
            x: 0,
            y: 6
        )
        .padding(.horizontal, 16)
        .padding(.bottom, 12)
    }

    // MARK: - Chat Bubble

    @ViewBuilder
    private func chatBubble(for message: AssistantChatMessage) -> some View {
        HStack(alignment: .bottom, spacing: 10) {
            if message.isUser {
                Spacer(minLength: 44)
            } else {
                // Assistant Glow Avatar
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color(hex: "007AFF"), Color(hex: "5856D6"), Color(hex: "AF52DE")],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 32, height: 32)
                        .shadow(color: Color.purple.opacity(0.4), radius: 6, x: 0, y: 2)

                    Image(systemName: "sparkles")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.white)
                }
            }

            VStack(alignment: message.isUser ? .trailing : .leading, spacing: 8) {
                Text(message.text.isEmpty && aiService.isGenerating ? " " : message.text)
                    .font(.system(.body, design: .rounded))
                    .fontWeight(message.isUser ? .medium : .regular)
                    .foregroundColor(message.isUser ? .white : .primary)
                    .lineSpacing(3)
                    .textSelection(.enabled)

                if !message.isUser && (message.text.contains("Itinéraire") || message.text.contains("itinéraire") || coordinator.previewJourney != nil) {
                    Button {
                        triggerHaptic(style: .medium)
                        coordinator.switchToExplore()
                        dismiss()
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "map.fill")
                                .font(.system(size: 12, weight: .bold))
                            Text("Voir l'aperçu sur la carte")
                                .font(.system(size: 13, weight: .bold, design: .rounded))
                            Image(systemName: "chevron.right")
                                .font(.system(size: 11, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background {
                            Capsule()
                                .fill(
                                    LinearGradient(
                                        colors: [Color.blue, Color(hex: "5856D6")],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                        }
                        .clipShape(Capsule())
                        .shadow(color: Color.blue.opacity(0.35), radius: 6, x: 0, y: 2)
                    }
                    .buttonStyle(.liquidGlassInteractive)
                    .padding(.top, 4)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background {
                if message.isUser {
                    // Liquid Iridescent User Bubble
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(hex: "007AFF"),
                                    Color(hex: "5856D6"),
                                    Color(hex: "7952DE")
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 22, style: .continuous)
                                .strokeBorder(
                                    LinearGradient(
                                        colors: [
                                            Color.white.opacity(0.40),
                                            Color.white.opacity(0.10),
                                            Color.clear
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 1
                                )
                        )
                        .shadow(color: Color.blue.opacity(0.35), radius: 10, x: 0, y: 4)
                } else {
                    // Liquid Glass Specular Assistant Bubble
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .fill(.ultraThinMaterial)
                        .overlay(
                            RoundedRectangle(cornerRadius: 22, style: .continuous)
                                .fill(LiquidGlassTheme.cardBackgroundTint(for: colorScheme))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 22, style: .continuous)
                                .strokeBorder(
                                    LiquidGlassTheme.specularBorder(for: colorScheme),
                                    lineWidth: 1
                                )
                        )
                        .shadow(
                            color: colorScheme == .dark ? Color.black.opacity(0.35) : Color.black.opacity(0.06),
                            radius: 10,
                            x: 0,
                            y: 4
                        )
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))

            if !message.isUser {
                Spacer(minLength: 44)
            }
        }
    }

    // MARK: - Actions & Logic

    private func submitCurrentInput() {
        let trimmed = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty, !aiService.isGenerating else { return }
        
        triggerHaptic(style: .medium)
        
        withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
            inputText = ""
        }
        
        sendPrompt(trimmed)
    }

    private func sendPrompt(_ text: String) {
        let userMsg = AssistantChatMessage(isUser: true, text: text)
        
        withAnimation(.spring(response: 0.45, dampingFraction: 0.75)) {
            messages.append(userMsg)
        }

        let assistantMsg = AssistantChatMessage(isUser: false, text: "", isStreaming: true)
        
        withAnimation(.spring(response: 0.45, dampingFraction: 0.75).delay(0.1)) {
            messages.append(assistantMsg)
        }
        
        let assistantIndex = messages.count - 1

        Task {
            do {
                let stream = aiService.streamAssistant(prompt: text)
                for try await snapshot in stream {
                    await MainActor.run {
                        if assistantIndex < messages.count {
                            withAnimation(.easeOut(duration: 0.12)) {
                                messages[assistantIndex].text = snapshot
                            }
                        }
                    }
                }
                await MainActor.run {
                    if assistantIndex < messages.count {
                        messages[assistantIndex].isStreaming = false
                        triggerHaptic(style: .light)
                    }
                }
            } catch {
                await MainActor.run {
                    if assistantIndex < messages.count {
                        messages[assistantIndex].text = "Désolé, une erreur est survenue lors de la génération de la réponse : \(error.localizedDescription)"
                        messages[assistantIndex].isStreaming = false
                        triggerHaptic(style: .heavy)
                    }
                }
            }
        }
    }

    private func triggerHaptic(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        #if canImport(UIKit)
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
        #endif
    }
}

#Preview("Flow Assistant Light") {
    if #available(iOS 27.0, *) {
        FlowAssistantView()
            .preferredColorScheme(.light)
    }
}

#Preview("Flow Assistant Dark") {
    if #available(iOS 27.0, *) {
        FlowAssistantView()
            .preferredColorScheme(.dark)
    }
}
