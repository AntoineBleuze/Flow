import SwiftUI
import UIKit

@MainActor
struct SFProVariableWeightModifier: ViewModifier {
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
    @MainActor
    func sfProVariableWeight(weight: CGFloat, size: CGFloat) -> some View {
        self.modifier(SFProVariableWeightModifier(weight: weight, size: size))
    }
}

struct VariableWaveProperties {
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
        // --- TIMINGS ACCÉLÉRÉS ---
        let staggerDelay = 0.12 // Vitesse de propagation de mot à mot (divisée par ~2)
        let delay = Double(sequenceIndex) * staggerDelay
        let animationDuration = 1.0 // Durée totale de la déformation d'un mot (passée de 2.0s à 1.0s)
        
        let totalLoopDuration = 2.2 // Durée totale d'une boucle complète avant répétition
        let restDuration = totalLoopDuration - animationDuration - delay
        
        Text(text)
            .fixedSize(horizontal: true, vertical: true)
            .foregroundColor(.black)
            .keyframeAnimator(initialValue: VariableWaveProperties(), repeating: true) { @MainActor content, value in
                content
                    .sfProVariableWeight(weight: value.weight, size: size)
            } keyframes: { _ in
                KeyframeTrack(\.weight) {
                    CubicKeyframe(0.40, duration: delay)
                    
                    // --- ETAPES RAPIDES ET NERVEUSES ---
                    CubicKeyframe(0.62, duration: 0.25)  // Black (très rapide)
                    CubicKeyframe(0.40, duration: 0.25)  // Retour Bold
                    CubicKeyframe(-0.60, duration: 0.30) // Ultra Light profond
                    CubicKeyframe(0.40, duration: 0.20)  // Retour rapide au Bold de repos
                    
                    CubicKeyframe(0.40, duration: restDuration)
                }
            }
    }
}

#Preview {
    SFProVariableWaveView()
}
