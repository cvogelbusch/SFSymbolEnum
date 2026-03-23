import Foundation

private typealias ReleaseDate = String
private typealias SymbolName = String
private typealias ReleaseVersions = [String: String]

private struct SymbolEntry {
    let name: SymbolName
    let releaseDate: ReleaseDate

    var identifier: String {
        var parts = name.split(separator: ".", omittingEmptySubsequences: false).map(String.init)
        let firstPart = parts.removeFirst()
        var camelCase = firstPart + parts.map { $0.prefix(1).uppercased() + $0.dropFirst() }.joined()

        if camelCase.first?.isNumber == true {
            camelCase = "number" + camelCase
        }

        if swiftKeywords.contains(camelCase) {
            camelCase = "`\(camelCase)`"
        }

        return camelCase
    }
}

private enum MetadataError: Error, LocalizedError {
    case metadataNotFound
    case malformedMetadata
    case missingReleaseDefinitions([ReleaseDate])

    var errorDescription: String? {
        switch self {
        case .metadataNotFound:
            return "Unable to locate SF Symbols metadata. Set SF_SYMBOLS_METADATA_PLIST to override the default app bundle path."
        case .malformedMetadata:
            return "The SF Symbols metadata plist is missing required keys."
        case .missingReleaseDefinitions(let missingReleaseDates):
            return "Missing release definitions for symbol release dates: \(missingReleaseDates.joined(separator: ", "))"
        }
    }
}

private let preferredPlatformOrder = ["iOS", "macOS", "tvOS", "visionOS", "watchOS"]
private let swiftKeywords: Set<String> = [
    "Any", "Self", "actor", "as", "associatedtype", "async", "await", "borrowing",
    "break", "case", "catch", "class", "consume", "consuming", "continue", "copy",
    "default", "defer", "deinit", "distributed", "do", "each", "else", "enum",
    "extension", "false", "fileprivate", "for", "func", "guard", "if", "import", "in",
    "init", "inout", "internal", "is", "isolated", "let", "macro", "nil",
    "nonisolated", "open", "operator", "package", "precedencegroup", "private",
    "protocol", "public", "repeat", "rethrows", "return", "self", "sending", "some",
    "static", "struct", "subscript", "super", "switch", "throw", "throws", "true",
    "try", "typealias", "var", "where", "while"
]

private let outputHeader = """
// this file has been generated
// you can recreate it using generateSFSymbolEnum.swift script

public enum SFSymbol: String, Sendable {
"""

private func metadataURL() throws -> URL {
    let environment = ProcessInfo.processInfo.environment
    let candidates = [
        environment["SF_SYMBOLS_METADATA_PLIST"].map(URL.init(fileURLWithPath:)),
        URL(fileURLWithPath: "/Applications/SF Symbols beta.app/Contents/Resources/Metadata/name_availability.plist"),
        URL(fileURLWithPath: "/Applications/SF Symbols.app/Contents/Resources/Metadata/name_availability.plist"),
        URL(fileURLWithPath: "/Applications/SF Symbols.app/Contents/Resources/Metadata-Public/name_availability.plist")
    ].compactMap { $0 }

    guard let url = candidates.first(where: { FileManager.default.fileExists(atPath: $0.path) }) else {
        throw MetadataError.metadataNotFound
    }

    return url
}

private func releaseAvailability(from versions: ReleaseVersions) -> String {
    let orderedPlatforms = preferredPlatformOrder.filter { versions[$0] != nil }
    let remainingPlatforms = versions.keys
        .filter { !preferredPlatformOrder.contains($0) }
        .sorted()
    let allPlatforms = orderedPlatforms + remainingPlatforms

    let requirements = allPlatforms.compactMap { platform in
        versions[platform].map { "\(platform) \($0)" }
    }

    return "available(" + requirements.joined(separator: ", ") + ", *)"
}

private func readMetadata(from fileURL: URL) throws -> ([SymbolEntry], [ReleaseDate: ReleaseVersions]) {
    let data = try Data(contentsOf: fileURL, options: .mappedIfSafe)
    let propertyList = try PropertyListSerialization.propertyList(from: data, format: nil)

    guard
        let metadata = propertyList as? [String: Any],
        let symbols = metadata["symbols"] as? [SymbolName: ReleaseDate],
        let releases = metadata["year_to_release"] as? [ReleaseDate: ReleaseVersions]
    else {
        throw MetadataError.malformedMetadata
    }

    let missingReleaseDates = Array(Set(symbols.values).subtracting(releases.keys)).sorted()
    guard missingReleaseDates.isEmpty else {
        throw MetadataError.missingReleaseDefinitions(missingReleaseDates)
    }

    let unsortedEntries: [SymbolEntry] = symbols.map { key, value in
        SymbolEntry(name: key, releaseDate: value)
    }
    let entries = unsortedEntries.sorted { lhs, rhs in
        lhs.releaseDate == rhs.releaseDate ? lhs.name < rhs.name : lhs.releaseDate < rhs.releaseDate
    }

    return (entries, releases)
}

private func generatedSource(entries: [SymbolEntry], releases: [ReleaseDate: ReleaseVersions]) -> String {
    var lines = [outputHeader]

    for entry in entries {
        let availability = releaseAvailability(from: releases[entry.releaseDate]!)
        lines.append("    @\(availability) case \(entry.identifier) = \"\(entry.name)\"")
    }

    lines.append("}")
    lines.append("")
    lines.append("extension SFSymbol: CaseIterable {")
    lines.append("    public static let allCases: [SFSymbol] = {")
    lines.append("        var allCases: [SFSymbol] = []")

    var currentReleaseDate: ReleaseDate?
    for entry in entries {
        if entry.releaseDate != currentReleaseDate {
            if currentReleaseDate != nil {
                lines.append("            ])")
                lines.append("        }")
                lines.append("")
            }

            let availability = releaseAvailability(from: releases[entry.releaseDate]!)
            lines.append("        if #\(availability) {")
            lines.append("            allCases.append(contentsOf: [")
            lines.append("                .\(entry.identifier)")
            currentReleaseDate = entry.releaseDate
        } else {
            lines[lines.endIndex - 1] += ","
            lines.append("                .\(entry.identifier)")
        }
    }

    if currentReleaseDate != nil {
        lines.append("            ])")
        lines.append("        }")
    }

    lines.append("")
    lines.append("        return allCases")
    lines.append("    }()")
    lines.append("}")

    return lines.joined(separator: "\n")
}

do {
    let url = try metadataURL()
    let (entries, releases) = try readMetadata(from: url)
    print(generatedSource(entries: entries, releases: releases))
} catch {
    fputs("error: \(error.localizedDescription)\n", stderr)
    exit(1)
}
