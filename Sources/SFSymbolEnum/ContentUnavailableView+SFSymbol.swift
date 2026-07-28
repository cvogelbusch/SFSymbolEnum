import Foundation
import SwiftUI

@available(iOS 17.0, macOS 14.0, tvOS 17.0, visionOS 1.0, watchOS 10.0, *)
public extension ContentUnavailableView where Label == SwiftUI.Label<Text, Image>, Description == Text?, Actions == EmptyView {
    init(_ titleKey: LocalizedStringKey, symbol: SFSymbol, description: Text? = nil) {
        self.init(titleKey, systemImage: symbol.name, description: description)
    }

    init<S>(_ title: S, symbol: SFSymbol, description: Text? = nil) where S: StringProtocol {
        self.init(title, systemImage: symbol.name, description: description)
    }

    init(_ titleResource: LocalizedStringResource, symbol: SFSymbol, description: Text? = nil) {
        self.init(titleResource, systemImage: symbol.name, description: description)
    }
}
