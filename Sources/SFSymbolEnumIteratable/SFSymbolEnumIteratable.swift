import SFSymbolEnum

public extension SFSymbol {
    static func named(_ name: String) -> SFSymbol? {
        allCases.first { $0.name == name }
    }
}
