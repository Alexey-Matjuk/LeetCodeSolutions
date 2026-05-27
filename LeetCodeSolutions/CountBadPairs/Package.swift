// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CountBadPairs",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "CountBadPairs",
            path: "Sources"
        ),
        .testTarget(
            name: "CountBadPairsTests",
            dependencies: ["CountBadPairs"],
            path: "Tests"
        ),
    ]
)
