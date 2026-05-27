// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RemoveOccurrences",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "RemoveOccurrences",
            path: "Sources"
        ),
        .testTarget(
            name: "RemoveOccurrencesTests",
            dependencies: ["RemoveOccurrences"],
            path: "Tests"
        ),
    ]
)
