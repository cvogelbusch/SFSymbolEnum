import Foundation
import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *)
public extension Label where Title == Text, Icon == Image {
    init(_ titleKey: LocalizedStringKey, symbol: SFSymbol) {
        self.init(titleKey, systemImage: symbol.name)
    }

    init<S>(_ title: S, symbol: SFSymbol) where S: StringProtocol {
        self.init(title, systemImage: symbol.name)
    }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
    init(_ titleResource: LocalizedStringResource, symbol: SFSymbol) {
        self.init(titleResource, systemImage: symbol.name)
    }
}
