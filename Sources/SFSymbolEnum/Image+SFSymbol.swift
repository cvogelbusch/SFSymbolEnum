import SwiftUI

public extension SFSymbol {
    @available(iOS 13.0, macOS 11.0, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
    var image: Image { Image(systemName: rawValue) }
}

@available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
public extension Image {
    @available(iOS 13.0, macOS 11.0, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
    init(systemName symbol: SFSymbol) {
        self = Image(systemName: symbol.name)
    }

    @available(iOS 13.0, macOS 11.0, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
    init(symbol: SFSymbol) {
        self = Image(systemName: symbol.name)
    }
}
