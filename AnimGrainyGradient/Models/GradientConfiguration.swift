import SwiftUI
import CoreGraphics
import simd

enum BlobTransitionMode: String, CaseIterable, Identifiable {
    case orbit = "Orbit"
    case smoothMove = "Smooth Move"
    case splitMerge = "Split & Merge"
    case breathe = "Breathe"
    case wave = "Wave"
    
    var id: String { rawValue }
}

struct GradientBlob: Identifiable, Equatable {
    let id = UUID()
    var color: SIMD4<Float>
    var position: SIMD2<Float>
    var targetPosition: SIMD2<Float>
    var radius: Float
    var speed: Float
    var phase: Float
    var orbitRadius: SIMD2<Float>
    var transitionMode: Int32
    
    init(
        color: Color,
        position: SIMD2<Float> = SIMD2<Float>(0.5, 0.5),
        targetPosition: SIMD2<Float>? = nil,
        radius: Float = 0.4,
        speed: Float = 1.0,
        phase: Float = 0.0,
        orbitRadius: SIMD2<Float> = SIMD2<Float>(0.2, 0.2),
        transitionMode: BlobTransitionMode = .wave
    ) {
        self.color = Self.colorToSIMD(color)
        self.position = position
        self.targetPosition = targetPosition ?? position
        self.radius = radius
        self.speed = speed
        self.phase = phase
        self.orbitRadius = orbitRadius
        self.transitionMode = Int32(BlobTransitionMode.allCases.firstIndex(of: transitionMode) ?? 0)
    }
    
    init(
        r: Float, g: Float, b: Float, a: Float = 1.0,
        position: SIMD2<Float> = SIMD2<Float>(0.5, 0.5),
        targetPosition: SIMD2<Float>? = nil,
        radius: Float = 0.4,
        speed: Float = 1.0,
        phase: Float = 0.0,
        orbitRadius: SIMD2<Float> = SIMD2<Float>(0.2, 0.2),
        transitionMode: BlobTransitionMode = .wave
    ) {
        self.color = SIMD4<Float>(r, g, b, a)
        self.position = position
        self.targetPosition = targetPosition ?? position
        self.radius = radius
        self.speed = speed
        self.phase = phase
        self.orbitRadius = orbitRadius
        self.transitionMode = Int32(BlobTransitionMode.allCases.firstIndex(of: transitionMode) ?? 0)
    }
    
    private static func colorToSIMD(_ color: Color) -> SIMD4<Float> {
        guard let cgColor = color.cgColor,
              let components = cgColor.components, components.count >= 3 else {
            return SIMD4<Float>(0, 0, 0, 1)
        }
        let r = components[0]
        let g = components.count > 1 ? components[1] : r
        let b = components.count > 2 ? components[2] : r
        let a = cgColor.alpha
        return SIMD4<Float>(Float(r), Float(g), Float(b), Float(a))
    }
}

struct GradientConfiguration: Equatable {
    var blobs: [GradientBlob]
    var backgroundColor: SIMD4<Float>
    var grainIntensity: Float
    var grainScale: Float
    var animationSpeed: Float
    var blurRadius: Float
    var saturation: Float
    var brightness: Float
    var noiseOctaves: Int
    var flowDistortion: Float
    var liquidEffect: Float
    var enableStatic: Bool
    var transitionSpeed: Float
    
    init(
        blobs: [GradientBlob] = [],
        backgroundColor: Color = .white,
        grainIntensity: Float = 0.08,
        grainScale: Float = 1.0,
        animationSpeed: Float = 1.0,
        blurRadius: Float = 0.3,
        saturation: Float = 1.0,
        brightness: Float = 1.0,
        noiseOctaves: Int = 4,
        flowDistortion: Float = 0.02,
        liquidEffect: Float = 0.5,
        enableStatic: Bool = true,
        transitionSpeed: Float = 1.0
    ) {
        self.blobs = blobs
        self.backgroundColor = Self.colorToSIMD(backgroundColor)
        self.grainIntensity = grainIntensity
        self.grainScale = grainScale
        self.animationSpeed = animationSpeed
        self.blurRadius = blurRadius
        self.saturation = saturation
        self.brightness = brightness
        self.noiseOctaves = noiseOctaves
        self.flowDistortion = flowDistortion
        self.liquidEffect = liquidEffect
        self.enableStatic = enableStatic
        self.transitionSpeed = transitionSpeed
    }
    
    private static func colorToSIMD(_ color: Color) -> SIMD4<Float> {
        guard let cgColor = color.cgColor,
              let components = cgColor.components, components.count >= 3 else {
            return SIMD4<Float>(0, 0, 0, 1)
        }
        let r = components[0]
        let g = components.count > 1 ? components[1] : r
        let b = components.count > 2 ? components[2] : r
        let a = cgColor.alpha
        return SIMD4<Float>(Float(r), Float(g), Float(b), Float(a))
    }
}

struct GradientUniforms {
    var time: Float
    var resolution: SIMD2<Float>
    var backgroundColor: SIMD4<Float>
    var grainIntensity: Float
    var grainScale: Float
    var blurRadius: Float
    var saturation: Float
    var brightness: Float
    var noiseOctaves: Int32
    var flowDistortion: Float
    var liquidEffect: Float
    var blobCount: Int32
    var enableStatic: Int32
    var transitionSpeed: Float
    var padding: Float = 0
}

struct BlobData {
    var color: SIMD4<Float>
    var position: SIMD2<Float>
    var targetPosition: SIMD2<Float>
    var radius: Float
    var speed: Float
    var phase: Float
    var orbitRadiusX: Float
    var orbitRadiusY: Float
    var transitionMode: Int32
    var padding: Float = 0
}
