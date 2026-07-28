import XCTest
import SFSymbolEnum
import SFSymbolEnumIteratable
import SwiftUI

final class SFSymbolEnumTests: XCTestCase {
    func testSymbolNameMatchesRawValue() {
        XCTAssertEqual(SFSymbol.person.name, "person")
    }

    func testIteratableTargetAddsAllCases() {
        XCTAssertTrue(SFSymbol.allCases.contains(.person))
    }

    func testIteratableTargetAddsNameLookup() {
        XCTAssertEqual(SFSymbol.named("person"), .person)
        XCTAssertNil(SFSymbol.named("not.a.symbol"))
    }

    @available(iOS 13.0, macOS 11.0, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
    func testImageConvenienceInitializersCompile() {
        let imageFromSystemName = Image(systemName: .person)
        let imageFromSymbol = Image(symbol: .person)

        _ = imageFromSystemName
        _ = imageFromSymbol
    }

    @available(iOS 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *)
    func testLabelConvenienceInitializersCompile() {
        let labelFromSymbol = Label("Person", symbol: .person)

        _ = labelFromSymbol
    }

    @available(iOS 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 8.0, *)
    func testButtonConvenienceInitializersCompile() {
        let button = Button("Person", symbol: .person) {}
        let roleButton = Button("Cancel", symbol: .person, role: .cancel) {}

        _ = button
        _ = roleButton
    }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
    func testToggleConvenienceInitializersCompile() {
        let toggle = Toggle("Enabled", symbol: .person, isOn: .constant(true))
        let sourceToggle = Toggle("Enabled", symbol: .person, sources: [Binding.constant(true)], isOn: \.self)

        _ = toggle
        _ = sourceToggle
    }

    @available(iOS 15.0, macOS 12.0, tvOS 17.0, visionOS 1.0, *)
    func testMenuConvenienceInitializersCompile() {
        let menu = Menu("Actions", symbol: .ellipsisCircle) {
            Button("Run") {}
        }
        let primaryActionMenu = Menu("Actions", symbol: .ellipsisCircle) {
            Button("Run") {}
        } primaryAction: {}

        _ = menu
        _ = primaryActionMenu
    }

    @available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
    func testPickerConvenienceInitializersCompile() {
        let picker = Picker("Choice", symbol: .person, selection: .constant(1)) {
            Text("One").tag(1)
        }
        let sourcePicker = Picker("Choice", symbol: .person, sources: [Binding.constant(1)], selection: \.self) {
            Text("One").tag(1)
        }
        let currentValuePicker = Picker("Choice", symbol: .person, selection: .constant(1)) {
            Text("One").tag(1)
        } currentValueLabel: {
            Text("One")
        }

        _ = picker
        _ = sourcePicker
        _ = currentValuePicker
    }

    @available(iOS 16.0, macOS 13.0, tvOS 17.0, visionOS 1.0, *)
    func testControlGroupConvenienceInitializersCompile() {
        let controlGroup = ControlGroup("Tools", symbol: .hammer) {
            Button("Run") {}
        }

        _ = controlGroup
    }

    @available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
    func testTabConvenienceInitializersCompile() {
        let tab = Tab("Home", symbol: .house) {
            Text("Home")
        }
        let roleTab = Tab("Search", symbol: .magnifyingglass, role: .search) {
            Text("Search")
        }
        let valueTab = Tab("Home", symbol: .house, value: 1) {
            Text("Home")
        }

        _ = tab
        _ = roleTab
        _ = valueTab
    }

    @available(macOS 13.0, *)
    func testMenuBarExtraConvenienceInitializersCompile() {
        let menuBarExtra = MenuBarExtra("Status", symbol: .person) {
            Text("Menu")
        }
        let insertedMenuBarExtra = MenuBarExtra("Status", symbol: .person, isInserted: .constant(true)) {
            Text("Menu")
        }

        _ = menuBarExtra
        _ = insertedMenuBarExtra
    }

    @available(iOS 26.0, macOS 26.0, tvOS 26.0, visionOS 26.0, watchOS 26.0, *)
    func testAssistiveAccessNavigationIconSymbolModifierCompiles() {
        let view = Text("Home").assistiveAccessNavigationIcon(symbol: .house)

        _ = view
    }

    @available(iOS 17.0, macOS 14.0, tvOS 17.0, visionOS 1.0, watchOS 10.0, *)
    func testContentUnavailableViewAcceptsStaticStringSymbolMembers() {
        let view = ContentUnavailableView(
            "No People",
            symbol: .person,
            description: Text("No people are available.")
        )

        _ = view
    }
}
