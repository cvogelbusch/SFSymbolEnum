import Foundation
import SwiftUI

@available(iOS 16.0, macOS 13.0, tvOS 17.0, visionOS 1.0, *)
@available(watchOS, unavailable)
public extension ControlGroup {
    init<C>(_ titleKey: LocalizedStringKey, symbol: SFSymbol, @ViewBuilder content: () -> C) where Content == LabeledControlGroupContent<C, SwiftUI.Label<Text, Image>>, C: View {
        self.init(titleKey, systemImage: symbol.name, content: content)
    }

    init<C, S>(_ title: S, symbol: SFSymbol, @ViewBuilder content: () -> C) where Content == LabeledControlGroupContent<C, SwiftUI.Label<Text, Image>>, C: View, S: StringProtocol {
        self.init(title, systemImage: symbol.name, content: content)
    }

    init<C>(_ titleResource: LocalizedStringResource, symbol: SFSymbol, @ViewBuilder content: () -> C) where Content == LabeledControlGroupContent<C, SwiftUI.Label<Text, Image>>, C: View {
        self.init(titleResource, systemImage: symbol.name, content: content)
    }
}
