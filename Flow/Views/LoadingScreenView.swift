import SwiftUI

struct LoadingScreenView: View {
    @ObservedObject private var mapData = MapDataService.shared
    @Binding var isPresented: Bool
    
    @State private var introPhase = 0
    @State private var shaderOpacity: Double = 0.0
    @State private var isLoading = true
    @State private var hasTriggeredWave = false
    @State private var contentScale: CGFloat = 1.0
    @State private var contentOpacity: Double = 1.0 // Immediately visible at start
    
    var body: some View {
        ZStack {
            // Clean black backdrop
            Color.black
                .ignoresSafeArea()

            
            // 1. Metal Shader Animation in background
            if shaderOpacity > 0.0 {
                ShaderAnimationView(isLoading: isLoading, station: nil)
                    .opacity(shaderOpacity)
            }
            
            // 2. Premium typography branding centered (using SF Pro font)
            VStack(spacing: 16) {
                WWDCTextAnimator(text: "Flow", fontSize: 48, animationType: .reveal, speed: 0.9, delay: 0.1)
                    .foregroundColor(.white)
                    .scaleEffect(contentScale)
                    .opacity(contentOpacity)
                
                WWDCTextAnimator(text: "Le réseau francilien en temps réel", fontSize: 14, animationType: .reveal, speed: 1.2, delay: 0.4)
                    .foregroundColor(.gray)
                    .scaleEffect(contentScale)
                    .opacity(contentOpacity)
                
                // Subtle progress indicator to show activity
                if isLoading && introPhase >= 1 {
                    ProgressView()
                        .tint(.white)
                        .scaleEffect(0.9)
                        .padding(.top, 12)
                        .transition(.opacity)
                }
            }
            .padding(32)
        }
        .onAppear {
            // Start data loading immediately
            MapDataService.shared.loadData()
            
            // Wait 0.3s before showing the ProgressView to avoid a flashing indicator on cache hit
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                introPhase = 1
                checkLoadingCompletion()
            }
        }
        .onChange(of: mapData.loadingProgress) { _, newValue in
            if newValue >= 1.0 && !hasTriggeredWave {
                triggerExit()
            }
        }
    }
    
    private func checkLoadingCompletion() {
        if mapData.loadingProgress >= 1.0 && !hasTriggeredWave {
            triggerExit()
        }
    }
    
    private func triggerExit() {
        hasTriggeredWave = true
        isLoading = false
        
        // Dissolve typography and fade in the shader animation over 1.0s
        withAnimation(.easeInOut(duration: 1.0)) {
            shaderOpacity = 1.0
            contentScale = 1.1
            contentOpacity = 0.0
        }
        
        // After the 1.0s animation completes, dismiss the entire loading screen to reveal the main screen over 0.4s
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeInOut(duration: 0.4)) {
                isPresented = false
            }
        }
    }
}

#Preview {
    LoadingScreenView(isPresented: .constant(true))
}
