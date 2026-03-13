import SwiftUI

struct AnimatedGradientView: View {
    @State private var renderer: GradientRenderer
    var configuration: GradientConfiguration
    var fps: Int
    
    init(
        configuration: GradientConfiguration = GradientPreset.serendipity.configuration,
        fps: Int = 60
    ) {
        self.configuration = configuration
        self.fps = fps
        _renderer = State(wrappedValue: GradientRenderer(configuration: configuration))
    }
    
    var body: some View {
        MetalGradientView(renderer: renderer, preferredFPS: fps)
            .onChange(of: configuration) { _, newConfig in
                renderer.updateConfiguration(newConfig)
            }
            .ignoresSafeArea()
    }
}

extension AnimatedGradientView {
    init(preset: GradientPreset, fps: Int = 60) {
        self.init(configuration: preset.configuration, fps: fps)
    }
}
