import SwiftUI

struct ContentView: View {
    @StateObject private var settings = GradientSettings()
    @Environment(\.colorScheme) private var colorScheme
    
    private var currentConfiguration: GradientConfiguration {
        var config: GradientConfiguration
        let isDark = effectiveIsDark
        
        if isDark {
            config = settings.selectedPreset.darkConfiguration
        } else {
            config = settings.selectedPreset.configuration
        }
        
        settings.applyToConfiguration(&config)
        return config
    }
    
    private var effectiveIsDark: Bool {
        switch settings.selectedTheme {
        case .auto:
            return colorScheme == .dark
        case .light:
            return false
        case .dark:
            return true
        }
    }
    
    var body: some View {
        ZStack {
            AnimatedGradientView(configuration: currentConfiguration, fps: 30)
                .ignoresSafeArea()
            
            if settings.showOverlay {
                OverlayView(settings: settings)
            }
        }
        .sheet(isPresented: $settings.showControls) {
            GradientControlsView(settings: settings)
        }
    }
}

private struct OverlayView: View {
    @ObservedObject var settings: GradientSettings
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            VStack(spacing: 24) {
                Text(settings.selectedPreset.rawValue)
                    .font(.system(size: 38, weight: .regular, design: .serif))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                    .lineSpacing(4)
                
                VStack(spacing: 4) {
                    Text("A beautiful animated gradient")
                    Text("with smooth flowing colors.")
                }
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                
                Button(action: { settings.showControls = true }) {
                    Text("Customize")
                        .font(.system(size: 15, weight: .medium))
                        .tracking(2)
                        .foregroundColor(.primary)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 28)
                                .stroke(Color.primary.opacity(0.3), lineWidth: 1)
                        )
                }
                .padding(.top, 8)
            }
            .padding(.horizontal, 32)
            
            Spacer()
            Spacer()
        }
        .transition(.opacity)
    }
}

#Preview {
    ContentView()
}
