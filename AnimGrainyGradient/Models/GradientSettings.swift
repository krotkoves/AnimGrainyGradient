import SwiftUI
import Combine
import simd

final class GradientSettings: ObservableObject {
    @Published var selectedPreset: GradientPreset = .serendipity
    @Published var grainIntensity: Float = 0.03
    @Published var animationSpeed: Float = 0.8
    @Published var liquidEffect: Float = 0.6
    @Published var saturation: Float = 0.6
    @Published var brightness: Float = 1.05
    @Published var blurRadius: Float = 0.35
    @Published var flowDistortion: Float = 0.015
    @Published var enableStatic: Bool = false
    @Published var transitionSpeed: Float = 2.0
    @Published var showControls: Bool = false
    @Published var showOverlay: Bool = true
    @Published var selectedTransitionMode: BlobTransitionMode = .orbit
    
    private var cancellables = Set<AnyCancellable>()

    init() {
        $selectedPreset
            .sink { [weak self] (preset: GradientPreset) in
                self?.loadFromPreset(preset)
            }
            .store(in: &cancellables)
    }

    func loadFromPreset(_ preset: GradientPreset) {
        let config = preset.configuration
        grainIntensity = config.grainIntensity
        animationSpeed = config.animationSpeed
        liquidEffect = config.liquidEffect
        saturation = config.saturation
        brightness = config.brightness
        blurRadius = config.blurRadius
        flowDistortion = config.flowDistortion
        enableStatic = config.enableStatic
        transitionSpeed = config.transitionSpeed
    }

    func applyToConfiguration(_ config: inout GradientConfiguration) {
        config.grainIntensity = grainIntensity
        config.animationSpeed = animationSpeed
        config.liquidEffect = liquidEffect
        config.saturation = saturation
        config.brightness = brightness
        config.blurRadius = blurRadius
        config.flowDistortion = flowDistortion
        config.enableStatic = enableStatic
        config.transitionSpeed = transitionSpeed
        
        let mode = Int32(BlobTransitionMode.allCases.firstIndex(of: selectedTransitionMode) ?? 0)
        for i in 0..<config.blobs.count {
            config.blobs[i].transitionMode = mode
        }
    }
}
