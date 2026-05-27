// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LargestIsland",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "LargestIsland",
            path: "Sources"
        ),
        .testTarget(
            name: "LargestIslandTests",
            dependencies: ["LargestIsland"],
            path: "Tests"
        ),
    ]
)
