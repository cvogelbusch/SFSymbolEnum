import Foundation
import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *)
public extension Toggle where Label == SwiftUI.Label<Text, Image> {
    init(_ titleKey: LocalizedStringKey, symbol: SFSymbol, isOn: Binding<Bool>) {
        self.init(titleKey, systemImage: symbol.name, isOn: isOn)
    }

    init<S>(_ title: S, symbol: SFSymbol, isOn: Binding<Bool>) where S: StringProtocol {
        self.init(title, systemImage: symbol.name, isOn: isOn)
    }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
    init(_ titleResource: LocalizedStringResource, symbol: SFSymbol, isOn: Binding<Bool>) {
        self.init(titleResource, systemImage: symbol.name, isOn: isOn)
    }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
    init<C>(_ titleKey: LocalizedStringKey, symbol: SFSymbol, sources: C, isOn: KeyPath<C.Element, Binding<Bool>>) where C: RandomAccessCollection {
        self.init(titleKey, systemImage: symbol.name, sources: sources, isOn: isOn)
    }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
    init<S, C>(_ title: S, symbol: SFSymbol, sources: C, isOn: KeyPath<C.Element, Binding<Bool>>) where S: StringProtocol, C: RandomAccessCollection {
        self.init(title, systemImage: symbol.name, sources: sources, isOn: isOn)
    }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
    init<C>(_ titleResource: LocalizedStringResource, symbol: SFSymbol, sources: C, isOn: KeyPath<C.Element, Binding<Bool>>) where C: RandomAccessCollection {
        self.init(titleResource, systemImage: symbol.name, sources: sources, isOn: isOn)
    }
}
