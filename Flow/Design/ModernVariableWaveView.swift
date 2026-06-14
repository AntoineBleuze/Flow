import SwiftUI
import UIKit

fileprivate struct SFProVariableWeightModifier: ViewModifier {
    let weight: CGFloat
    let size: CGFloat

    func body(content: Content) -> some View {
        content
            .font(Font(createVariableFont()))
    }

    private func createVariableFont() -> UIFont {
        let baseFont = UIFont.systemFont(ofSize: size)
        let attributes: [UIFontDescriptor.AttributeName: Any] = [
            .traits: [
                kCTFontWeightTrait: weight
            ]
        ]
        let descriptor = baseFont.fontDescriptor.addingAttributes(attributes)
        return UIFont(descriptor: descriptor, size: size)
    }
}

extension View {
    nonisolated fileprivate func sfProVariableWeight(weight: CGFloat, size: CGFloat) -> some View {
        self.modifier(SFProVariableWeightModifier(weight: weight, size: size))
    }
}

fileprivate struct VariableWaveProperties {
    var weight: CGFloat = 0.40 // Ligne de base : Bold
}

struct SFProVariableWaveView: View {
    let words = ["Implement", "high-resolution", "photo", "capture"]
    let fontSize: CGFloat = 22
    
    var body: some View {
        ZStack {
            Color(red: 218/255, green: 138/255, blue: 54/255)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 8) {
                    VariableWordView(text: words[0], sequenceIndex: 0, size: fontSize)
                    VariableWordView(text: words[1], sequenceIndex: 1, size: fontSize)
                }
                HStack(spacing: 8) {
                    VariableWordView(text: words[2], sequenceIndex: 2, size: fontSize)
                    VariableWordView(text: words[3], sequenceIndex: 3, size: fontSize)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 24)
            .padding(.trailing, 16)
        }
    }
}

struct VariableWordView: View {
    let text: String
    let sequenceIndex: Int
    let size: CGFloat
    
    var body: some View {
        // --- TIMINGS ÉQUILIBRÉS ET TRANSPARENTS ---
        let staggerDelay = 0.12
        let delay = Double(sequenceIndex) * staggerDelay
        let animationDuration = 1.0 // Durée de l'onde (0.2 + 0.2 + 0.3 + 0.3)
        
        // On baisse la durée globale à 1.5s pour enchaîner presque instantanément
        let totalLoopDuration = 1.5
        let restDuration = totalLoopDuration - animationDuration - delay
        
        Text(text)
            .fixedSize(horizontal: true, vertical: true)
            .foregroundColor(.black)
            .keyframeAnimator(initialValue: VariableWaveProperties(), repeating: true) { content, value in
                content
                    .sfProVariableWeight(weight: value.weight, size: size)
            } keyframes: { _ in
                KeyframeTrack(\.weight) {
                    // Attente initiale
                    CubicKeyframe(0.40, duration: delay)
                    
                    // --- COURBE DE VÉLOCITÉ LISSÉE ---
                    CubicKeyframe(0.62, duration: 0.20)  // 1. Monte au Black
                    CubicKeyframe(0.40, duration: 0.20)  // 2. Redescend au Bold
                    CubicKeyframe(-0.60, duration: 0.30) // 3. Plonge doucement dans l'Ultra Light
                    CubicKeyframe(0.40, duration: 0.30)  // 4. Remonte au Bold à la même vitesse (0.30s)
                    
                    // Phase de repos ultra-courte avant le prochain reset
                    CubicKeyframe(0.40, duration: max(0, restDuration))
                }
            }
    }
}

#Preview {
    SFProVariableWaveView()
}
