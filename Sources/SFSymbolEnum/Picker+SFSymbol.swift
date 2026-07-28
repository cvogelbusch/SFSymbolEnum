import Foundation
import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *)
public extension Picker where Label == SwiftUI.Label<Text, Image> {
    init(_ titleKey: LocalizedStringKey, symbol: SFSymbol, selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content) {
        self.init(titleKey, systemImage: symbol.name, selection: selection, content: content)
    }

    init<S>(_ title: S, symbol: SFSymbol, selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content) where S: StringProtocol {
        self.init(title, systemImage: symbol.name, selection: selection, content: content)
    }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
    init(_ titleResource: LocalizedStringResource, symbol: SFSymbol, selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content) {
        self.init(titleResource, systemImage: symbol.name, selection: selection, content: content)
    }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
    init<C>(_ titleKey: LocalizedStringKey, symbol: SFSymbol, sources: C, selection: KeyPath<C.Element, Binding<SelectionValue>>, @ViewBuilder content: () -> Content) where C: RandomAccessCollection, C.Element == Binding<SelectionValue> {
        self.init(titleKey, systemImage: symbol.name, sources: sources, selection: selection, content: content)
    }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
    init<S, C>(_ title: S, symbol: SFSymbol, sources: C, selection: KeyPath<C.Element, Binding<SelectionValue>>, @ViewBuilder content: () -> Content) where S: StringProtocol, C: RandomAccessCollection, C.Element == Binding<SelectionValue> {
        self.init(title, systemImage: symbol.name, sources: sources, selection: selection, content: content)
    }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
    init<C>(_ titleResource: LocalizedStringResource, symbol: SFSymbol, sources: C, selection: KeyPath<C.Element, Binding<SelectionValue>>, @ViewBuilder content: () -> Content) where C: RandomAccessCollection, C.Element == Binding<SelectionValue> {
        self.init(titleResource, systemImage: symbol.name, sources: sources, selection: selection, content: content)
    }

    @available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
    init<CurrentValueLabel>(_ titleKey: LocalizedStringKey, symbol: SFSymbol, selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content, @ViewBuilder currentValueLabel: () -> CurrentValueLabel) where CurrentValueLabel: View {
        self.init(titleKey, systemImage: symbol.name, selection: selection, content: content, currentValueLabel: currentValueLabel)
    }

    @available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
    init<S, CurrentValueLabel>(_ title: S, symbol: SFSymbol, selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content, @ViewBuilder currentValueLabel: () -> CurrentValueLabel) where S: StringProtocol, CurrentValueLabel: View {
        self.init(title, systemImage: symbol.name, selection: selection, content: content, currentValueLabel: currentValueLabel)
    }

    @available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
    init<CurrentValueLabel>(_ titleResource: LocalizedStringResource, symbol: SFSymbol, selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content, @ViewBuilder currentValueLabel: () -> CurrentValueLabel) where CurrentValueLabel: View {
        self.init(titleResource, systemImage: symbol.name, selection: selection, content: content, currentValueLabel: currentValueLabel)
    }

    @available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
    init<C, CurrentValueLabel>(_ titleKey: LocalizedStringKey, symbol: SFSymbol, sources: C, selection: KeyPath<C.Element, Binding<SelectionValue>>, @ViewBuilder content: () -> Content, @ViewBuilder currentValueLabel: () -> CurrentValueLabel) where C: RandomAccessCollection, C.Element == Binding<SelectionValue>, CurrentValueLabel: View {
        self.init(titleKey, systemImage: symbol.name, sources: sources, selection: selection, content: content, currentValueLabel: currentValueLabel)
    }

    @available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
    init<S, C, CurrentValueLabel>(_ title: S, symbol: SFSymbol, sources: C, selection: KeyPath<C.Element, Binding<SelectionValue>>, @ViewBuilder content: () -> Content, @ViewBuilder currentValueLabel: () -> CurrentValueLabel) where S: StringProtocol, C: RandomAccessCollection, C.Element == Binding<SelectionValue>, CurrentValueLabel: View {
        self.init(title, systemImage: symbol.name, sources: sources, selection: selection, content: content, currentValueLabel: currentValueLabel)
    }

    @available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
    init<C, CurrentValueLabel>(_ titleResource: LocalizedStringResource, symbol: SFSymbol, sources: C, selection: KeyPath<C.Element, Binding<SelectionValue>>, @ViewBuilder content: () -> Content, @ViewBuilder currentValueLabel: () -> CurrentValueLabel) where C: RandomAccessCollection, C.Element == Binding<SelectionValue>, CurrentValueLabel: View {
        self.init(titleResource, systemImage: symbol.name, sources: sources, selection: selection, content: content, currentValueLabel: currentValueLabel)
    }
}
