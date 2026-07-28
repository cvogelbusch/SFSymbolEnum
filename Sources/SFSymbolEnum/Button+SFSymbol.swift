import Foundation
import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *)
public extension Button where Label == SwiftUI.Label<Text, Image> {
    init(_ titleKey: LocalizedStringKey, symbol: SFSymbol, action: @escaping () -> Void) {
        self.init(titleKey, systemImage: symbol.name, action: action)
    }

    init<S>(_ title: S, symbol: SFSymbol, action: @escaping () -> Void) where S: StringProtocol {
        self.init(title, systemImage: symbol.name, action: action)
    }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
    init(_ titleResource: LocalizedStringResource, symbol: SFSymbol, action: @escaping () -> Void) {
        self.init(titleResource, systemImage: symbol.name, action: action)
    }

    @available(iOS 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 8.0, *)
    init(_ titleKey: LocalizedStringKey, symbol: SFSymbol, role: ButtonRole?, action: @escaping () -> Void) {
        self.init(titleKey, systemImage: symbol.name, role: role, action: action)
    }

    @available(iOS 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 8.0, *)
    init<S>(_ title: S, symbol: SFSymbol, role: ButtonRole?, action: @escaping () -> Void) where S: StringProtocol {
        self.init(title, systemImage: symbol.name, role: role, action: action)
    }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
    init(_ titleResource: LocalizedStringResource, symbol: SFSymbol, role: ButtonRole?, action: @escaping () -> Void) {
        self.init(titleResource, systemImage: symbol.name, role: role, action: action)
    }
}
