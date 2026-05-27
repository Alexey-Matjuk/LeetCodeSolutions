// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MaxScore",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "MaxScore",
            path: "Sources"
        ),
        .testTarget(
            name: "MaxScoreTests",
            dependencies: ["MaxScore"],
            path: "Tests"
        ),
    ]
)
