// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ConstructDistancedSequence",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "ConstructDistancedSequence",
            path: "Sources"
        ),
        .testTarget(
            name: "ConstructDistancedSequenceTests",
            dependencies: ["ConstructDistancedSequence"],
            path: "Tests"
        ),
    ]
)
