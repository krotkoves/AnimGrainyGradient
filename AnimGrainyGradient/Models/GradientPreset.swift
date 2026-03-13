import SwiftUI

enum GradientPreset: String, CaseIterable, Identifiable {
    case serendipity = "Serendipity"
    case aurora = "Aurora"
    case sunset = "Sunset"
    case ocean = "Ocean"
    case lavender = "Lavender"
    case mint = "Mint Fresh"
    case warmGlow = "Warm Glow"
    case midnight = "Midnight"
    case peach = "Peach Dream"
    case forest = "Forest"
    case rose = "Rose"
    case sky = "Sky"
    case coral = "Coral"
    case lime = "Lime"
    case berry = "Berry"
    case honey = "Honey"
    case oceanBreeze = "Ocean Breeze"
    case purpleHaze = "Purple Haze"
    case sunrise = "Sunrise"
    case denim = "Denim"
    
    var id: String { rawValue }
    
    var configuration: GradientConfiguration {
        switch self {
        case .serendipity:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(
                        r: 0.75, g: 0.78, b: 0.95, a: 0.95,
                        position: SIMD2<Float>(0.3, 0.3),
                        radius: 0.55,
                        speed: 0.3,
                        phase: 0.0,
                        orbitRadius: SIMD2<Float>(0.15, 0.12)
                    ),
                    GradientBlob(
                        r: 0.65, g: 0.70, b: 0.90, a: 0.9,
                        position: SIMD2<Float>(0.7, 0.4),
                        radius: 0.5,
                        speed: 0.25,
                        phase: 1.5,
                        orbitRadius: SIMD2<Float>(0.18, 0.14)
                    ),
                    GradientBlob(
                        r: 0.80, g: 0.75, b: 0.92, a: 0.85,
                        position: SIMD2<Float>(0.5, 0.7),
                        radius: 0.45,
                        speed: 0.35,
                        phase: 3.0,
                        orbitRadius: SIMD2<Float>(0.12, 0.16)
                    ),
                    GradientBlob(
                        r: 0.70, g: 0.72, b: 0.88, a: 0.8,
                        position: SIMD2<Float>(0.2, 0.6),
                        radius: 0.4,
                        speed: 0.2,
                        phase: 4.5,
                        orbitRadius: SIMD2<Float>(0.10, 0.10)
                    ),
                    GradientBlob(
                        r: 0.78, g: 0.80, b: 0.94, a: 0.75,
                        position: SIMD2<Float>(0.8, 0.7),
                        radius: 0.35,
                        speed: 0.28,
                        phase: 2.0,
                        orbitRadius: SIMD2<Float>(0.14, 0.18)
                    ),
                ],
                backgroundColor: Color(red: 0.94, green: 0.95, blue: 0.98),
                grainIntensity: 0.12,
                grainScale: 1.5,
                animationSpeed: 4,
                blurRadius: 0.7,
                saturation: 0.8,
                brightness: 1.0,
                noiseOctaves: 5,
                flowDistortion: 0.100,
                liquidEffect: 1.5,
                enableStatic: false,
                transitionSpeed: 5
            )
            
        case .aurora:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(
                        r: 0.1, g: 0.9, b: 0.6, a: 0.8,
                        position: SIMD2<Float>(0.3, 0.2),
                        radius: 0.5,
                        speed: 0.4,
                        phase: 0.0,
                        orbitRadius: SIMD2<Float>(0.2, 0.15)
                    ),
                    GradientBlob(
                        r: 0.2, g: 0.5, b: 0.9, a: 0.7,
                        position: SIMD2<Float>(0.6, 0.5),
                        radius: 0.45,
                        speed: 0.35,
                        phase: 2.0,
                        orbitRadius: SIMD2<Float>(0.15, 0.2)
                    ),
                    GradientBlob(
                        r: 0.6, g: 0.2, b: 0.8, a: 0.6,
                        position: SIMD2<Float>(0.5, 0.8),
                        radius: 0.4,
                        speed: 0.3,
                        phase: 4.0,
                        orbitRadius: SIMD2<Float>(0.18, 0.12)
                    ),
                    GradientBlob(
                        r: 0.1, g: 0.7, b: 0.8, a: 0.5,
                        position: SIMD2<Float>(0.8, 0.3),
                        radius: 0.35,
                        speed: 0.45,
                        phase: 1.0,
                        orbitRadius: SIMD2<Float>(0.12, 0.18)
                    ),
                ],
                backgroundColor: Color(red: 0.05, green: 0.08, blue: 0.15),
                grainIntensity: 0.1,
                grainScale: 1.2,
                animationSpeed: 0.6,
                blurRadius: 0.3,
                saturation: 1.2,
                brightness: 1.0,
                noiseOctaves: 4,
                flowDistortion: 0.03,
                liquidEffect: 0.7,
                enableStatic: true,
                transitionSpeed: 1.0
            )
            
        case .sunset:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(
                        r: 1.0, g: 0.4, b: 0.2, a: 0.9,
                        position: SIMD2<Float>(0.3, 0.3),
                        radius: 0.5,
                        speed: 0.3,
                        phase: 0.0,
                        orbitRadius: SIMD2<Float>(0.15, 0.1)
                    ),
                    GradientBlob(
                        r: 1.0, g: 0.6, b: 0.3, a: 0.8,
                        position: SIMD2<Float>(0.6, 0.4),
                        radius: 0.45,
                        speed: 0.25,
                        phase: 1.5,
                        orbitRadius: SIMD2<Float>(0.12, 0.15)
                    ),
                    GradientBlob(
                        r: 0.9, g: 0.2, b: 0.4, a: 0.7,
                        position: SIMD2<Float>(0.5, 0.7),
                        radius: 0.5,
                        speed: 0.35,
                        phase: 3.0,
                        orbitRadius: SIMD2<Float>(0.18, 0.14)
                    ),
                    GradientBlob(
                        r: 0.4, g: 0.1, b: 0.5, a: 0.6,
                        position: SIMD2<Float>(0.7, 0.8),
                        radius: 0.4,
                        speed: 0.2,
                        phase: 4.5,
                        orbitRadius: SIMD2<Float>(0.10, 0.12)
                    ),
                ],
                backgroundColor: Color(red: 0.15, green: 0.05, blue: 0.1),
                grainIntensity: 0.08,
                grainScale: 1.0,
                animationSpeed: 0.5,
                blurRadius: 0.25,
                saturation: 1.3,
                brightness: 1.1,
                noiseOctaves: 4,
                flowDistortion: 0.02,
                liquidEffect: 0.5,
                enableStatic: true,
                transitionSpeed: 1.0
            )
            
        case .ocean:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(
                        r: 0.0, g: 0.4, b: 0.8, a: 0.9,
                        position: SIMD2<Float>(0.3, 0.3),
                        radius: 0.55,
                        speed: 0.25,
                        phase: 0.0,
                        orbitRadius: SIMD2<Float>(0.2, 0.15)
                    ),
                    GradientBlob(
                        r: 0.0, g: 0.6, b: 0.7, a: 0.8,
                        position: SIMD2<Float>(0.7, 0.4),
                        radius: 0.45,
                        speed: 0.3,
                        phase: 2.0,
                        orbitRadius: SIMD2<Float>(0.15, 0.2)
                    ),
                    GradientBlob(
                        r: 0.1, g: 0.3, b: 0.6, a: 0.7,
                        position: SIMD2<Float>(0.5, 0.7),
                        radius: 0.5,
                        speed: 0.2,
                        phase: 4.0,
                        orbitRadius: SIMD2<Float>(0.18, 0.12)
                    ),
                    GradientBlob(
                        r: 0.2, g: 0.7, b: 0.9, a: 0.5,
                        position: SIMD2<Float>(0.2, 0.6),
                        radius: 0.35,
                        speed: 0.35,
                        phase: 1.0,
                        orbitRadius: SIMD2<Float>(0.12, 0.16)
                    ),
                ],
                backgroundColor: Color(red: 0.02, green: 0.05, blue: 0.15),
                grainIntensity: 0.07,
                grainScale: 1.3,
                
                animationSpeed: 0.4,
                blurRadius: 0.3,
                saturation: 1.1,
                brightness: 1.0,
                noiseOctaves: 5,
                flowDistortion: 0.025,
                liquidEffect: 0.8,
                enableStatic: true,
                transitionSpeed: 1.0
            )
            
        case .lavender:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(
                        r: 0.7, g: 0.5, b: 0.9, a: 0.8,
                        position: SIMD2<Float>(0.3, 0.3),
                        radius: 0.5,
                        speed: 0.3,
                        phase: 0.0,
                        orbitRadius: SIMD2<Float>(0.15, 0.12)
                    ),
                    GradientBlob(
                        r: 0.9, g: 0.6, b: 0.8, a: 0.7,
                        position: SIMD2<Float>(0.7, 0.5),
                        radius: 0.45,
                        speed: 0.25,
                        phase: 2.0,
                        orbitRadius: SIMD2<Float>(0.18, 0.15)
                    ),
                    GradientBlob(
                        r: 0.5, g: 0.4, b: 0.8, a: 0.6,
                        position: SIMD2<Float>(0.5, 0.7),
                        radius: 0.4,
                        speed: 0.35,
                        phase: 4.0,
                        orbitRadius: SIMD2<Float>(0.12, 0.18)
                    ),
                    GradientBlob(
                        r: 0.85, g: 0.75, b: 0.95, a: 0.5,
                        position: SIMD2<Float>(0.4, 0.4),
                        radius: 0.5,
                        speed: 0.2,
                        phase: 1.0,
                        orbitRadius: SIMD2<Float>(0.14, 0.14)
                    ),
                ],
                backgroundColor: Color(red: 0.95, green: 0.92, blue: 0.98),
                grainIntensity: 0.06,
                grainScale: 1.2,
                animationSpeed: 0.35,
                blurRadius: 0.35,
                saturation: 0.8,
                brightness: 1.05,
                noiseOctaves: 4,
                flowDistortion: 0.015,
                liquidEffect: 0.5,
                enableStatic: true,
                transitionSpeed: 1.0
            )
            
        case .mint:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(
                        r: 0.4, g: 0.9, b: 0.8, a: 0.8,
                        position: SIMD2<Float>(0.3, 0.3),
                        radius: 0.5,
                        speed: 0.3,
                        phase: 0.0,
                        orbitRadius: SIMD2<Float>(0.15, 0.12)
                    ),
                    GradientBlob(
                        r: 0.6, g: 0.95, b: 0.85, a: 0.7,
                        position: SIMD2<Float>(0.7, 0.4),
                        radius: 0.45,
                        speed: 0.25,
                        phase: 2.0,
                        orbitRadius: SIMD2<Float>(0.12, 0.18)
                    ),
                    GradientBlob(
                        r: 0.3, g: 0.8, b: 0.7, a: 0.6,
                        position: SIMD2<Float>(0.5, 0.7),
                        radius: 0.4,
                        speed: 0.35,
                        phase: 3.5,
                        orbitRadius: SIMD2<Float>(0.18, 0.14)
                    ),
                ],
                backgroundColor: Color(red: 0.93, green: 0.98, blue: 0.96),
                grainIntensity: 0.05,
                grainScale: 1.4,
                
                animationSpeed: 0.4,
                blurRadius: 0.3,
                saturation: 0.7,
                brightness: 1.05,
                noiseOctaves: 4,
                flowDistortion: 0.012,
                liquidEffect: 0.4
            )
            
        case .warmGlow:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(
                        r: 1.0, g: 0.85, b: 0.6, a: 0.8,
                        position: SIMD2<Float>(0.4, 0.3),
                        radius: 0.55,
                        speed: 0.25,
                        phase: 0.0,
                        orbitRadius: SIMD2<Float>(0.15, 0.1)
                    ),
                    GradientBlob(
                        r: 1.0, g: 0.7, b: 0.5, a: 0.7,
                        position: SIMD2<Float>(0.6, 0.5),
                        radius: 0.45,
                        speed: 0.3,
                        phase: 1.5,
                        orbitRadius: SIMD2<Float>(0.12, 0.15)
                    ),
                    GradientBlob(
                        r: 0.95, g: 0.9, b: 0.75, a: 0.6,
                        position: SIMD2<Float>(0.3, 0.7),
                        radius: 0.5,
                        speed: 0.2,
                        phase: 3.0,
                        orbitRadius: SIMD2<Float>(0.14, 0.12)
                    ),
                ],
                backgroundColor: Color(red: 0.98, green: 0.95, blue: 0.90),
                grainIntensity: 0.05,
                grainScale: 1.0,
                animationSpeed: 0.3,
                blurRadius: 0.35,
                
                
                
                
                saturation: 0.7,
                brightness: 1.08,
                noiseOctaves: 3,
                flowDistortion: 0.01,
                liquidEffect: 0.4,
                enableStatic: true,
                transitionSpeed: 1.0
            )
            
        case .midnight:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(
                        r: 0.15, g: 0.1, b: 0.4, a: 0.9,
                        position: SIMD2<Float>(0.3, 0.3),
                        radius: 0.5,
                        speed: 0.2,
                        phase: 0.0,
                        orbitRadius: SIMD2<Float>(0.15, 0.12)
                    ),
                    GradientBlob(
                        r: 0.1, g: 0.15, b: 0.35, a: 0.8,
                        position: SIMD2<Float>(0.7, 0.4),
                        radius: 0.55,
                        speed: 0.25,
                        phase: 2.0,
                        orbitRadius: SIMD2<Float>(0.18, 0.15)
                    ),
                    GradientBlob(
                        r: 0.2, g: 0.1, b: 0.5, a: 0.6,
                        position: SIMD2<Float>(0.5, 0.7),
                        radius: 0.45,
                        speed: 0.3,
                        phase: 4.0,
                        orbitRadius: SIMD2<Float>(0.12, 0.18)
                    ),
                    GradientBlob(
                        r: 0.3, g: 0.2, b: 0.6, a: 0.4,
                        position: SIMD2<Float>(0.2, 0.6),
                        radius: 0.35,
                        speed: 0.15,
                        phase: 1.0,
                        orbitRadius: SIMD2<Float>(0.10, 0.14)
                    ),
                ],
                backgroundColor: Color(red: 0.03, green: 0.02, blue: 0.08),
                grainIntensity: 0.12,
                grainScale: 1.5,
                animationSpeed: 0.3,
                blurRadius: 0.3,
                
                
                
                
                saturation: 1.2,
                brightness: 0.9,
                noiseOctaves: 5,
                flowDistortion: 0.02,
                liquidEffect: 0.6,
                enableStatic: true,
                transitionSpeed: 1.0
            )
            
        case .peach:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(
                        r: 1.0, g: 0.8, b: 0.75, a: 0.8,
                        position: SIMD2<Float>(0.35, 0.3),
                        radius: 0.5,
                        speed: 0.3,
                        phase: 0.0,
                        orbitRadius: SIMD2<Float>(0.15, 0.12)
                    ),
                    GradientBlob(
                        r: 1.0, g: 0.7, b: 0.8, a: 0.7,
                        position: SIMD2<Float>(0.65, 0.5),
                        radius: 0.45,
                        speed: 0.25,
                        phase: 1.5,
                        orbitRadius: SIMD2<Float>(0.12, 0.15)
                    ),
                    GradientBlob(
                        r: 0.95, g: 0.85, b: 0.8, a: 0.6,
                        position: SIMD2<Float>(0.5, 0.7),
                        radius: 0.4,
                        speed: 0.35,
                        phase: 3.0,
                        orbitRadius: SIMD2<Float>(0.14, 0.10)
                    ),
                ],
                backgroundColor: Color(red: 0.98, green: 0.94, blue: 0.92),
                grainIntensity: 0.05,
                grainScale: 1.0,
                animationSpeed: 0.35,
                blurRadius: 0.35,
                
                
                
                
                saturation: 0.7,
                brightness: 1.06,
                noiseOctaves: 3,
                flowDistortion: 0.01,
                liquidEffect: 0.4,
                enableStatic: true,
                transitionSpeed: 1.0
            )
            
        case .forest:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(
                        r: 0.1, g: 0.5, b: 0.2, a: 0.8,
                        position: SIMD2<Float>(0.3, 0.3),
                        radius: 0.5,
                        speed: 0.2,
                        phase: 0.0,
                        orbitRadius: SIMD2<Float>(0.15, 0.12)
                    ),
                    GradientBlob(
                        r: 0.2, g: 0.6, b: 0.3, a: 0.7,
                        position: SIMD2<Float>(0.7, 0.4),
                        radius: 0.45,
                        speed: 0.25,
                        phase: 2.0,
                        orbitRadius: SIMD2<Float>(0.18, 0.15)
                    ),
                    GradientBlob(
                        r: 0.05, g: 0.35, b: 0.15, a: 0.6,
                        position: SIMD2<Float>(0.5, 0.7),
                        radius: 0.4,
                        speed: 0.3,
                        phase: 4.0,
                        orbitRadius: SIMD2<Float>(0.12, 0.18)
                    ),
                    GradientBlob(
                        r: 0.15, g: 0.45, b: 0.25, a: 0.5,
                        position: SIMD2<Float>(0.2, 0.6),
                        radius: 0.35,
                        speed: 0.15,
                        phase: 1.0,
                        orbitRadius: SIMD2<Float>(0.10, 0.14)
                    ),
                ],
                backgroundColor: Color(red: 0.04, green: 0.08, blue: 0.04),
                grainIntensity: 0.09,
                grainScale: 1.3,
                
                animationSpeed: 0.3,
                blurRadius: 0.3,
                
                
                
                
                saturation: 1.1,
                brightness: 0.95,
                noiseOctaves: 5,
                flowDistortion: 0.02,
                liquidEffect: 0.6,
                enableStatic: true,
                transitionSpeed: 1.0
            )
            
        case .rose:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(r: 0.9, g: 0.4, b: 0.5, a: 0.9, position: SIMD2<Float>(0.3, 0.3), radius: 0.5, speed: 0.3, phase: 0.0, orbitRadius: SIMD2<Float>(0.15, 0.12)),
                    GradientBlob(r: 0.85, g: 0.5, b: 0.6, a: 0.8, position: SIMD2<Float>(0.7, 0.5), radius: 0.45, speed: 0.25, phase: 2.0, orbitRadius: SIMD2<Float>(0.18, 0.15)),
                    GradientBlob(r: 0.95, g: 0.6, b: 0.7, a: 0.7, position: SIMD2<Float>(0.5, 0.7), radius: 0.4, speed: 0.35, phase: 4.0, orbitRadius: SIMD2<Float>(0.12, 0.18)),
                ],
                backgroundColor: Color(red: 0.98, green: 0.92, blue: 0.94),
                grainIntensity: 0.03,
                grainScale: 1.2,
                animationSpeed: 0.4,
                blurRadius: 0.3,
                saturation: 0.9,
                brightness: 1.0,
                noiseOctaves: 4,
                flowDistortion: 0.015,
                liquidEffect: 0.5,
                enableStatic: false,
                transitionSpeed: 1.0
            )
            
        case .sky:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(r: 0.4, g: 0.7, b: 1.0, a: 0.9, position: SIMD2<Float>(0.3, 0.3), radius: 0.55, speed: 0.25, phase: 0.0, orbitRadius: SIMD2<Float>(0.2, 0.15)),
                    GradientBlob(r: 0.5, g: 0.8, b: 1.0, a: 0.8, position: SIMD2<Float>(0.7, 0.4), radius: 0.45, speed: 0.3, phase: 2.0, orbitRadius: SIMD2<Float>(0.15, 0.2)),
                    GradientBlob(r: 0.6, g: 0.85, b: 0.95, a: 0.7, position: SIMD2<Float>(0.5, 0.7), radius: 0.5, speed: 0.2, phase: 4.0, orbitRadius: SIMD2<Float>(0.18, 0.12)),
                ],
                backgroundColor: Color(red: 0.85, green: 0.93, blue: 1.0),
                grainIntensity: 0.02,
                grainScale: 1.5,
                animationSpeed: 0.35,
                blurRadius: 0.25,
                saturation: 0.8,
                brightness: 1.05,
                noiseOctaves: 4,
                flowDistortion: 0.01,
                liquidEffect: 0.4,
                enableStatic: false,
                transitionSpeed: 1.0
            )
            
        case .coral:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(r: 1.0, g: 0.5, b: 0.4, a: 0.9, position: SIMD2<Float>(0.35, 0.3), radius: 0.5, speed: 0.3, phase: 0.0, orbitRadius: SIMD2<Float>(0.15, 0.12)),
                    GradientBlob(r: 1.0, g: 0.6, b: 0.5, a: 0.8, position: SIMD2<Float>(0.65, 0.5), radius: 0.45, speed: 0.25, phase: 1.5, orbitRadius: SIMD2<Float>(0.12, 0.15)),
                    GradientBlob(r: 0.95, g: 0.7, b: 0.6, a: 0.7, position: SIMD2<Float>(0.5, 0.7), radius: 0.4, speed: 0.35, phase: 3.0, orbitRadius: SIMD2<Float>(0.14, 0.10)),
                ],
                backgroundColor: Color(red: 1.0, green: 0.92, blue: 0.88),
                grainIntensity: 0.02,
                grainScale: 1.0,
                animationSpeed: 0.4,
                blurRadius: 0.35,
                saturation: 0.8,
                brightness: 1.02,
                noiseOctaves: 3,
                flowDistortion: 0.01,
                liquidEffect: 0.4,
                enableStatic: false,
                transitionSpeed: 1.0
            )
            
        case .lime:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(r: 0.6, g: 0.9, b: 0.3, a: 0.85, position: SIMD2<Float>(0.3, 0.35), radius: 0.5, speed: 0.3, phase: 0.0, orbitRadius: SIMD2<Float>(0.15, 0.12)),
                    GradientBlob(r: 0.7, g: 0.95, b: 0.4, a: 0.75, position: SIMD2<Float>(0.7, 0.45), radius: 0.45, speed: 0.25, phase: 2.0, orbitRadius: SIMD2<Float>(0.18, 0.15)),
                    GradientBlob(r: 0.5, g: 0.85, b: 0.25, a: 0.65, position: SIMD2<Float>(0.5, 0.7), radius: 0.4, speed: 0.35, phase: 4.0, orbitRadius: SIMD2<Float>(0.12, 0.18)),
                ],
                backgroundColor: Color(red: 0.92, green: 0.98, blue: 0.85),
                grainIntensity: 0.02,
                grainScale: 1.4,
                animationSpeed: 0.4,
                blurRadius: 0.3,
                saturation: 0.7,
                brightness: 1.05,
                noiseOctaves: 4,
                flowDistortion: 0.012,
                liquidEffect: 0.5,
                enableStatic: false,
                transitionSpeed: 1.0
            )
            
        case .berry:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(r: 0.6, g: 0.2, b: 0.8, a: 0.9, position: SIMD2<Float>(0.3, 0.3), radius: 0.5, speed: 0.25, phase: 0.0, orbitRadius: SIMD2<Float>(0.15, 0.12)),
                    GradientBlob(r: 0.75, g: 0.3, b: 0.9, a: 0.8, position: SIMD2<Float>(0.7, 0.5), radius: 0.45, speed: 0.3, phase: 2.0, orbitRadius: SIMD2<Float>(0.18, 0.15)),
                    GradientBlob(r: 0.5, g: 0.15, b: 0.7, a: 0.7, position: SIMD2<Float>(0.5, 0.7), radius: 0.4, speed: 0.35, phase: 4.0, orbitRadius: SIMD2<Float>(0.12, 0.18)),
                ],
                backgroundColor: Color(red: 0.95, green: 0.92, blue: 0.98),
                grainIntensity: 0.02,
                grainScale: 1.2,
                animationSpeed: 0.35,
                blurRadius: 0.3,
                saturation: 0.9,
                brightness: 1.02,
                noiseOctaves: 4,
                flowDistortion: 0.015,
                liquidEffect: 0.5,
                enableStatic: false,
                transitionSpeed: 1.0
            )
            
        case .honey:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(r: 1.0, g: 0.85, b: 0.3, a: 0.9, position: SIMD2<Float>(0.35, 0.3), radius: 0.5, speed: 0.25, phase: 0.0, orbitRadius: SIMD2<Float>(0.15, 0.1)),
                    GradientBlob(r: 1.0, g: 0.75, b: 0.4, a: 0.8, position: SIMD2<Float>(0.65, 0.5), radius: 0.45, speed: 0.3, phase: 1.5, orbitRadius: SIMD2<Float>(0.12, 0.15)),
                    GradientBlob(r: 0.95, g: 0.8, b: 0.5, a: 0.7, position: SIMD2<Float>(0.4, 0.7), radius: 0.5, speed: 0.2, phase: 3.0, orbitRadius: SIMD2<Float>(0.14, 0.12)),
                ],
                backgroundColor: Color(red: 1.0, green: 0.96, blue: 0.88),
                grainIntensity: 0.02,
                grainScale: 1.0,
                animationSpeed: 0.3,
                blurRadius: 0.35,
                saturation: 0.8,
                brightness: 1.05,
                noiseOctaves: 3,
                flowDistortion: 0.01,
                liquidEffect: 0.4,
                enableStatic: false,
                transitionSpeed: 1.0
            )
            
        case .oceanBreeze:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(r: 0.2, g: 0.8, b: 0.9, a: 0.85, position: SIMD2<Float>(0.3, 0.3), radius: 0.55, speed: 0.2, phase: 0.0, orbitRadius: SIMD2<Float>(0.18, 0.12)),
                    GradientBlob(r: 0.3, g: 0.6, b: 0.8, a: 0.75, position: SIMD2<Float>(0.7, 0.45), radius: 0.45, speed: 0.25, phase: 2.0, orbitRadius: SIMD2<Float>(0.15, 0.18)),
                    GradientBlob(r: 0.4, g: 0.9, b: 0.85, a: 0.65, position: SIMD2<Float>(0.5, 0.7), radius: 0.4, speed: 0.3, phase: 4.0, orbitRadius: SIMD2<Float>(0.12, 0.16)),
                ],
                backgroundColor: Color(red: 0.85, green: 0.95, blue: 0.98),
                grainIntensity: 0.02,
                grainScale: 1.3,
                animationSpeed: 0.35,
                blurRadius: 0.3,
                saturation: 0.75,
                brightness: 1.05,
                noiseOctaves: 4,
                flowDistortion: 0.02,
                liquidEffect: 0.6,
                enableStatic: false,
                transitionSpeed: 1.0
            )
            
        case .purpleHaze:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(r: 0.5, g: 0.3, b: 0.8, a: 0.9, position: SIMD2<Float>(0.3, 0.25), radius: 0.5, speed: 0.2, phase: 0.0, orbitRadius: SIMD2<Float>(0.15, 0.12)),
                    GradientBlob(r: 0.6, g: 0.4, b: 0.9, a: 0.8, position: SIMD2<Float>(0.7, 0.5), radius: 0.45, speed: 0.25, phase: 2.0, orbitRadius: SIMD2<Float>(0.18, 0.15)),
                    GradientBlob(r: 0.4, g: 0.2, b: 0.7, a: 0.7, position: SIMD2<Float>(0.5, 0.75), radius: 0.4, speed: 0.3, phase: 4.0, orbitRadius: SIMD2<Float>(0.12, 0.18)),
                ],
                backgroundColor: Color(red: 0.92, green: 0.9, blue: 0.96),
                grainIntensity: 0.03,
                grainScale: 1.2,
                animationSpeed: 0.3,
                blurRadius: 0.35,
                saturation: 0.85,
                brightness: 1.0,
                noiseOctaves: 4,
                flowDistortion: 0.018,
                liquidEffect: 0.55,
                enableStatic: false,
                transitionSpeed: 1.0
            )
            
        case .sunrise:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(r: 1.0, g: 0.5, b: 0.2, a: 0.95, position: SIMD2<Float>(0.3, 0.25), radius: 0.55, speed: 0.2, phase: 0.0, orbitRadius: SIMD2<Float>(0.15, 0.1)),
                    GradientBlob(r: 1.0, g: 0.7, b: 0.3, a: 0.85, position: SIMD2<Float>(0.6, 0.45), radius: 0.5, speed: 0.25, phase: 1.5, orbitRadius: SIMD2<Float>(0.12, 0.15)),
                    GradientBlob(r: 0.95, g: 0.4, b: 0.5, a: 0.75, position: SIMD2<Float>(0.4, 0.7), radius: 0.45, speed: 0.3, phase: 3.0, orbitRadius: SIMD2<Float>(0.14, 0.12)),
                    GradientBlob(r: 1.0, g: 0.8, b: 0.5, a: 0.65, position: SIMD2<Float>(0.75, 0.65), radius: 0.35, speed: 0.35, phase: 4.5, orbitRadius: SIMD2<Float>(0.1, 0.14)),
                ],
                backgroundColor: Color(red: 1.0, green: 0.92, blue: 0.8),
                grainIntensity: 0.02,
                grainScale: 1.0,
                animationSpeed: 0.35,
                blurRadius: 0.3,
                saturation: 0.9,
                brightness: 1.05,
                noiseOctaves: 3,
                flowDistortion: 0.012,
                liquidEffect: 0.45,
                enableStatic: false,
                transitionSpeed: 1.0
            )
            
        case .denim:
            return GradientConfiguration(
                blobs: [
                    GradientBlob(r: 0.25, g: 0.45, b: 0.75, a: 0.9, position: SIMD2<Float>(0.3, 0.3), radius: 0.5, speed: 0.2, phase: 0.0, orbitRadius: SIMD2<Float>(0.15, 0.12)),
                    GradientBlob(r: 0.35, g: 0.55, b: 0.85, a: 0.8, position: SIMD2<Float>(0.7, 0.45), radius: 0.45, speed: 0.25, phase: 2.0, orbitRadius: SIMD2<Float>(0.18, 0.15)),
                    GradientBlob(r: 0.2, g: 0.4, b: 0.7, a: 0.7, position: SIMD2<Float>(0.5, 0.7), radius: 0.4, speed: 0.3, phase: 4.0, orbitRadius: SIMD2<Float>(0.12, 0.18)),
                ],
                backgroundColor: Color(red: 0.88, green: 0.92, blue: 0.98),
                grainIntensity: 0.03,
                grainScale: 1.4,
                animationSpeed: 0.3,
                blurRadius: 0.35,
                saturation: 0.7,
                brightness: 1.02,
                noiseOctaves: 5,
                flowDistortion: 0.015,
                liquidEffect: 0.5,
                enableStatic: false,
                transitionSpeed: 1.0
            )
        }
    }
    
    var icon: String {
        switch self {
        case .aurora: return "sparkles"
        case .sunset: return "sun.horizon.fill"
        case .ocean: return "water.waves"
        case .lavender: return "leaf.fill"
        case .mint: return "drop.fill"
        case .warmGlow: return "sun.max.fill"
        case .midnight: return "moon.stars.fill"
        case .peach: return "heart.fill"
        case .forest: return "tree.fill"
        case .rose: return "heart.circle.fill"
        case .sky: return "cloud.sun.fill"
        case .coral: return "fish.fill"
        case .lime: return "leaf.circle.fill"
        case .berry: return "circle.grid.3x3.fill"
        case .honey: return "sunrise.fill"
        case .oceanBreeze: return "wind"
        case .purpleHaze: return "smoke.fill"
        case .sunrise: return "sun.and.horizon.fill"
        case .denim: return "rectangle.portrait.fill"
        }
    }
    
    var previewColors: [Color] {
        switch self {
        case .aurora: return [Color(red: 0.1, green: 0.9, blue: 0.6), Color(red: 0.6, green: 0.2, blue: 0.8)]
        case .sunset: return [Color(red: 1.0, green: 0.4, blue: 0.2), Color(red: 0.4, green: 0.1, blue: 0.5)]
        case .ocean: return [Color(red: 0.0, green: 0.4, blue: 0.8), Color(red: 0.2, green: 0.7, blue: 0.9)]
        case .lavender: return [Color(red: 0.7, green: 0.5, blue: 0.9), Color(red: 0.9, green: 0.6, blue: 0.8)]
        case .mint: return [Color(red: 0.4, green: 0.9, blue: 0.8), Color(red: 0.6, green: 0.95, blue: 0.85)]
        case .warmGlow: return [Color(red: 1.0, green: 0.85, blue: 0.6), Color(red: 1.0, green: 0.7, blue: 0.5)]
        case .midnight: return [Color(red: 0.15, green: 0.1, blue: 0.4), Color(red: 0.1, green: 0.15, blue: 0.35)]
        case .peach: return [Color(red: 1.0, green: 0.8, blue: 0.75), Color(red: 1.0, green: 0.7, blue: 0.8)]
        case .forest: return [Color(red: 0.1, green: 0.5, blue: 0.2), Color(red: 0.2, green: 0.6, blue: 0.3)]
        case .rose: return [Color(red: 0.9, green: 0.4, blue: 0.5), Color(red: 0.95, green: 0.6, blue: 0.7)]
        case .sky: return [Color(red: 0.4, green: 0.7, blue: 1.0), Color(red: 0.6, green: 0.85, blue: 1.0)]
        case .coral: return [Color(red: 1.0, green: 0.5, blue: 0.4), Color(red: 1.0, green: 0.7, blue: 0.6)]
        case .lime: return [Color(red: 0.6, green: 0.9, blue: 0.3), Color(red: 0.7, green: 0.95, blue: 0.4)]
        case .berry: return [Color(red: 0.6, green: 0.2, blue: 0.8), Color(red: 0.75, green: 0.3, blue: 0.9)]
        case .honey: return [Color(red: 1.0, green: 0.85, blue: 0.3), Color(red: 1.0, green: 0.75, blue: 0.4)]
        case .oceanBreeze: return [Color(red: 0.2, green: 0.8, blue: 0.9), Color(red: 0.3, green: 0.6, blue: 0.8)]
        case .purpleHaze: return [Color(red: 0.5, green: 0.3, blue: 0.8), Color(red: 0.6, green: 0.4, blue: 0.9)]
        case .sunrise: return [Color(red: 1.0, green: 0.5, blue: 0.2), Color(red: 1.0, green: 0.7, blue: 0.3)]
        case .denim: return [Color(red: 0.25, green: 0.45, blue: 0.75), Color(red: 0.35, green: 0.55, blue: 0.85)]
        }
    }
}
