import SwiftUI

struct PresetPickerView: View {
    @Binding var selectedPreset: GradientPreset
    @Namespace private var animation
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(GradientPreset.allCases) { preset in
                    PresetCard(
                        preset: preset,
                        isSelected: selectedPreset == preset,
                        namespace: animation
                    )
                    .onTapGesture {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                            selectedPreset = preset
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 8)
        }
    }
}

struct PresetCard: View {
    let preset: GradientPreset
    let isSelected: Bool
    var namespace: Namespace.ID
    
    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            colors: preset.previewColors,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 56, height: 56)
                
                if isSelected {
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(Color.white, lineWidth: 2.5)
                        .frame(width: 56, height: 56)
                        .matchedGeometryEffect(id: "selection", in: namespace)
                }
                
                Image(systemName: preset.icon)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
            }
            
            Text(preset.rawValue)
                .font(.system(size: 10, weight: isSelected ? .semibold : .regular))
                .foregroundColor(isSelected ? .white : .white.opacity(0.7))
                .lineLimit(1)
        }
        .scaleEffect(isSelected ? 1.05 : 1.0)
    }
}
