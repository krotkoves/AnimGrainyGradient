import SwiftUI

struct GradientControlsView: View {
    @ObservedObject var settings: GradientSettings
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                PresetSection(settings: settings)
                TransitionModeSection(settings: settings)
                AnimationSection(settings: settings)
                AppearanceSection(settings: settings)
                FilmGrainSection(settings: settings)
            }
            .navigationTitle("Customize")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

private struct PresetSection: View {
    @ObservedObject var settings: GradientSettings
    
    var body: some View {
        Section("Presets") {
            Picker("Preset", selection: $settings.selectedPreset) {
                ForEach(GradientPreset.allCases) { preset in
                    HStack {
                        Circle()
                            .fill(LinearGradient(
                                colors: preset.previewColors,
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            .frame(width: 20, height: 20)
                        Text(preset.rawValue)
                    }
                    .tag(preset)
                }
            }
            .pickerStyle(.navigationLink)
        }
    }
}

private struct TransitionModeSection: View {
    @ObservedObject var settings: GradientSettings
    
    var body: some View {
        Section("Transition Mode") {
            Picker("Mode", selection: $settings.selectedTransitionMode) {
                ForEach(BlobTransitionMode.allCases) { mode in
                    Text(mode.rawValue)
                        .tag(mode)
                }
            }
            .pickerStyle(.menu)
        }
    }
}

private struct AnimationSection: View {
    @ObservedObject var settings: GradientSettings
    
    var body: some View {
        Section("Animation") {
            SliderRow(title: "Speed", value: $settings.animationSpeed, range: 0...4.0, format: "%.1f")
            SliderRow(title: "Transition", value: $settings.transitionSpeed, range: 0.1...5.0, format: "%.1f")
        }
    }
}

private struct AppearanceSection: View {
    @ObservedObject var settings: GradientSettings
    
    var body: some View {
        Section("Appearance") {
            SliderRow(title: "Saturation", value: $settings.saturation, range: 0...2.0, format: "%.1f")
            SliderRow(title: "Brightness", value: $settings.brightness, range: 0.5...1.5, format: "%.2f")
            SliderRow(title: "Softness", value: $settings.blurRadius, range: 0...1.0, format: "%.2f")
            SliderRow(title: "Liquid", value: $settings.liquidEffect, range: 0...1.5, format: "%.1f")
            SliderRow(title: "Flow", value: $settings.flowDistortion, range: 0...0.1, format: "%.3f")
        }
    }
}

private struct FilmGrainSection: View {
    @ObservedObject var settings: GradientSettings
    
    var body: some View {
        Section("Film Grain") {
            Toggle("Film Static", isOn: $settings.enableStatic)
            SliderRow(title: "Amount", value: $settings.grainIntensity, range: 0...0.3, format: "%.2f")
        }
    }
}

private struct SliderRow: View {
    let title: String
    @Binding var value: Float
    let range: ClosedRange<Float>
    let format: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                Spacer()
                Text(String(format: format, value))
                    .foregroundColor(.secondary)
            }
            Slider(value: $value, in: range)
        }
    }
}

#Preview {
    GradientControlsView(settings: GradientSettings())
}
