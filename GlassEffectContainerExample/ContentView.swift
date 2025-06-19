import SwiftUI

enum ActionItem: CaseIterable {
    case like
    case share
    case bookmark
    
    var iconName: String {
        switch self {
        case .like:
            "heart.fill"
        case .share:
            "square.and.arrow.up"
        case .bookmark:
            "bookmark.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .like: .red
        case .share: .blue
        case .bookmark: .purple
        }
    }
}

struct ContentView: View {
    
    @State private var isExpanded: Bool = false
    
    var body: some View {
        GlassEffectContainer {
            VStack {
                Spacer()
                if isExpanded {
                    ForEach(ActionItem.allCases, id: \.self) { item in
                        Image(systemName: item.iconName)
                            .font(.headline)
                            .foregroundStyle(item.color.gradient)
                            .frame(width: 44, height: 44)
                            .glassEffect(.regular)
                    }
                }
                
                Button { isExpanded.toggle() } label: {
                    Image(systemName: "xmark")
                        .padding(4)
                        .rotationEffect(.degrees(isExpanded ? 0 : 45))
                        .fontWeight(.semibold)
                }
                .buttonStyle(.glass)
                .padding(.top, 4)
            }
            .tint(.primary)
            .frame(height: 200)
        }
        .animation(.smooth(duration: 0.6), value: isExpanded)
    }
}

#Preview {
    ContentView()
}
