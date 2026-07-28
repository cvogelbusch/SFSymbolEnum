import Foundation
import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 17.0, visionOS 1.0, *)
@available(watchOS, unavailable)
public extension Menu where Label == SwiftUI.Label<Text, Image> {
    init(_ titleKey: LocalizedStringKey, symbol: SFSymbol, @ViewBuilder content: () -> Content) {
        self.init(titleKey, systemImage: symbol.name, content: content)
    }

    init<S>(_ title: S, symbol: SFSymbol, @ViewBuilder content: () -> Content) where S: StringProtocol {
        self.init(title, systemImage: symbol.name, content: content)
    }

    @available(iOS 16.0, macOS 13.0, tvOS 17.0, visionOS 1.0, *)
    init(_ titleResource: LocalizedStringResource, symbol: SFSymbol, @ViewBuilder content: () -> Content) {
        self.init(titleResource, systemImage: symbol.name, content: content)
    }

    @available(iOS 15.0, macOS 12.0, tvOS 17.0, visionOS 1.0, *)
    init(_ titleKey: LocalizedStringKey, symbol: SFSymbol, @ViewBuilder content: () -> Content, primaryAction: @escaping () -> Void) {
        self.init(titleKey, systemImage: symbol.name, content: content, primaryAction: primaryAction)
    }

    @available(iOS 15.0, macOS 12.0, tvOS 17.0, visionOS 1.0, *)
    init<S>(_ title: S, symbol: SFSymbol, @ViewBuilder content: () -> Content, primaryAction: @escaping () -> Void) where S: StringProtocol {
        self.init {
            content()
        } label: {
            SwiftUI.Label(title, systemImage: symbol.name)
        } primaryAction: {
            primaryAction()
        }
    }

    @available(iOS 16.0, macOS 13.0, tvOS 17.0, visionOS 1.0, *)
    init(_ titleResource: LocalizedStringResource, symbol: SFSymbol, @ViewBuilder content: () -> Content, primaryAction: @escaping () -> Void) {
        self.init(titleResource, systemImage: symbol.name, content: content, primaryAction: primaryAction)
    }
}
