// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MinimumCost",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "MinimumCost",
            path: "Sources"
        ),
        .testTarget(
            name: "MinimumCostTests",
            dependencies: ["MinimumCost"],
            path: "Tests"
        ),
    ]
)
