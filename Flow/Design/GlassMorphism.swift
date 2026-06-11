import SwiftUI

// MARK: - Glass Segmented Picker for Unified Liquid Glass Design (iOS 26+)

public struct GlassSegmentedPicker<Value: Hashable, Label: View>: View {
    @Binding var selection: Value
    let items: [Value]
    let labelProvider: (Value) -> Label
    
    @Namespace private var animation
    @Environment(\.colorScheme) var colorScheme
    
    public init(selection: Binding<Value>, items: [Value], @ViewBuilder labelProvider: @escaping (Value) -> Label) {
        self._selection = selection
        self.items = items
        self.labelProvider = labelProvider
    }
    
    public var body: some View {
        HStack(spacing: 2) {
            ForEach(items, id: \.self) { item in
                let isSelected = selection == item
                Button(action: {
                    withAnimation(.spring(response: 0.28, dampingFraction: 0.82, blendDuration: 0)) {
                        selection = item
                    }
                }) {
                    labelProvider(item)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .frame(maxWidth: .infinity)
                        .contentShape(Rectangle())
                }
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(isSelected ? .primary : .secondary)
                .background(
                    ZStack {
                        if isSelected {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                // Top-level transparency selection overlay inside glass container
                                .fill(colorScheme == .dark ? Color.white.opacity(0.12) : Color.black.opacity(0.06))
                                .matchedGeometryEffect(id: "selectedSegment", in: animation)
                        }
                    }
                )
            }
        }
        .padding(3)
        // Authentic Liquid Glass container effect (iOS 26+)
        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}

// Convenience extension for text-only selections
public extension GlassSegmentedPicker where Label == Text {
    init(selection: Binding<Value>, items: [Value], titleProvider: @escaping (Value) -> String) {
        self.init(selection: selection, items: items) { value in
            Text(titleProvider(value))
                .font(.subheadline)
                .fontWeight(.bold)
        }
    }
}
