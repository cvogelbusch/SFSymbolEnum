import Foundation
import SwiftUI

@available(macOS 13.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
public extension MenuBarExtra where Label == SwiftUI.Label<Text, Image> {
    init(_ titleKey: LocalizedStringKey, symbol: SFSymbol, @ViewBuilder content: () -> Content) {
        self.init(titleKey, systemImage: symbol.name, content: content)
    }

    init<S>(_ title: S, symbol: SFSymbol, @ViewBuilder content: () -> Content) where S: StringProtocol {
        self.init(title, systemImage: symbol.name, content: content)
    }

    init(_ titleResource: LocalizedStringResource, symbol: SFSymbol, @ViewBuilder content: () -> Content) {
        self.init(titleResource, systemImage: symbol.name, content: content)
    }

    init(_ titleKey: LocalizedStringKey, symbol: SFSymbol, isInserted: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.init(titleKey, systemImage: symbol.name, isInserted: isInserted, content: content)
    }

    init<S>(_ title: S, symbol: SFSymbol, isInserted: Binding<Bool>, @ViewBuilder content: () -> Content) where S: StringProtocol {
        self.init(title, systemImage: symbol.name, isInserted: isInserted, content: content)
    }

    init(_ titleResource: LocalizedStringResource, symbol: SFSymbol, isInserted: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.init(titleResource, systemImage: symbol.name, isInserted: isInserted, content: content)
    }
}
