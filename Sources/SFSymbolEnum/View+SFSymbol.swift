import SwiftUI

@available(iOS 26.0, macOS 26.0, tvOS 26.0, visionOS 26.0, watchOS 26.0, *)
public extension View {
    nonisolated func assistiveAccessNavigationIcon(symbol: SFSymbol) -> some View {
        assistiveAccessNavigationIcon(systemImage: symbol.name)
    }
}
