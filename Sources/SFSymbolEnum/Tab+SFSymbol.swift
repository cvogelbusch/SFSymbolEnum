import Foundation
import SwiftUI

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public extension Tab where Value: Hashable, Content: View, Label == DefaultTabLabel {
    init(_ titleKey: LocalizedStringKey, symbol: SFSymbol, value: Value, @ViewBuilder content: () -> Content) {
        self.init(titleKey, systemImage: symbol.name, value: value, content: content)
    }

    init<S>(_ title: S, symbol: SFSymbol, value: Value, @ViewBuilder content: () -> Content) where S: StringProtocol {
        self.init(title, systemImage: symbol.name, value: value, content: content)
    }

    init(_ titleKey: LocalizedStringKey, symbol: SFSymbol, value: Value, role: TabRole?, @ViewBuilder content: () -> Content) {
        self.init(titleKey, systemImage: symbol.name, value: value, role: role, content: content)
    }

    init<S>(_ title: S, symbol: SFSymbol, value: Value, role: TabRole?, @ViewBuilder content: () -> Content) where S: StringProtocol {
        self.init(title, systemImage: symbol.name, value: value, role: role, content: content)
    }

    init<T>(_ titleKey: LocalizedStringKey, symbol: SFSymbol, value: T, @ViewBuilder content: () -> Content) where Value == T?, T: Hashable {
        self.init(titleKey, systemImage: symbol.name, value: value, content: content)
    }

    init<S, T>(_ title: S, symbol: SFSymbol, value: T, @ViewBuilder content: () -> Content) where Value == T?, S: StringProtocol, T: Hashable {
        self.init(title, systemImage: symbol.name, value: value, content: content)
    }

    init<T>(_ titleKey: LocalizedStringKey, symbol: SFSymbol, value: T, role: TabRole?, @ViewBuilder content: () -> Content) where Value == T?, T: Hashable {
        self.init(titleKey, systemImage: symbol.name, value: value, role: role, content: content)
    }

    init<S, T>(_ title: S, symbol: SFSymbol, value: T, role: TabRole?, @ViewBuilder content: () -> Content) where Value == T?, S: StringProtocol, T: Hashable {
        self.init(title, systemImage: symbol.name, value: value, role: role, content: content)
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, visionOS 26.0, watchOS 26.0, *)
public extension Tab where Value: Hashable, Content: View, Label == DefaultTabLabel {
    init(_ titleResource: LocalizedStringResource, symbol: SFSymbol, value: Value, @ViewBuilder content: () -> Content) {
        self.init(titleResource, systemImage: symbol.name, value: value, content: content)
    }

    init(_ titleResource: LocalizedStringResource, symbol: SFSymbol, value: Value, role: TabRole?, @ViewBuilder content: () -> Content) {
        self.init(titleResource, systemImage: symbol.name, value: value, role: role, content: content)
    }

    init<T>(_ titleResource: LocalizedStringResource, symbol: SFSymbol, value: T, @ViewBuilder content: () -> Content) where Value == T?, T: Hashable {
        self.init(titleResource, systemImage: symbol.name, value: value, content: content)
    }

    init<T>(_ titleResource: LocalizedStringResource, symbol: SFSymbol, value: T, role: TabRole?, @ViewBuilder content: () -> Content) where Value == T?, T: Hashable {
        self.init(titleResource, systemImage: symbol.name, value: value, role: role, content: content)
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public extension Tab where Value == Never, Content: View, Label == DefaultTabLabel {
    init(_ titleKey: LocalizedStringKey, symbol: SFSymbol, @ViewBuilder content: () -> Content) {
        self.init(titleKey, systemImage: symbol.name, content: content)
    }

    init<S>(_ title: S, symbol: SFSymbol, @ViewBuilder content: () -> Content) where S: StringProtocol {
        self.init(title, systemImage: symbol.name, content: content)
    }

    init(_ titleKey: LocalizedStringKey, symbol: SFSymbol, role: TabRole?, @ViewBuilder content: () -> Content) {
        self.init(titleKey, systemImage: symbol.name, role: role, content: content)
    }

    init<S>(_ title: S, symbol: SFSymbol, role: TabRole?, @ViewBuilder content: () -> Content) where S: StringProtocol {
        self.init(title, systemImage: symbol.name, role: role, content: content)
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, visionOS 26.0, watchOS 26.0, *)
public extension Tab where Value == Never, Content: View, Label == DefaultTabLabel {
    init(_ titleResource: LocalizedStringResource, symbol: SFSymbol, @ViewBuilder content: () -> Content) {
        self.init(titleResource, systemImage: symbol.name, content: content)
    }

    init(_ titleResource: LocalizedStringResource, symbol: SFSymbol, role: TabRole?, @ViewBuilder content: () -> Content) {
        self.init(titleResource, systemImage: symbol.name, role: role, content: content)
    }
}
