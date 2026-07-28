// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "SFSymbolEnum",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "SFSymbolEnum", targets: ["SFSymbolEnum"]),
        .library(name: "SFSymbolEnumIteratable", targets: ["SFSymbolEnumIteratable"])
    ],
    targets: [
        .target(name: "SFSymbolEnum"),
        .target(
            name: "SFSymbolEnumIteratable",
            dependencies: ["SFSymbolEnum"]
        ),
        .testTarget(
            name: "SFSymbolEnumTests",
            dependencies: [
                "SFSymbolEnum",
                "SFSymbolEnumIteratable"
            ]
        )
    ]
)
