// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MinCost",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "MinCost",
            path: "Sources"
        ),
        .testTarget(
            name: "MinCostTests",
            dependencies: ["MinCost"],
            path: "Tests"
        ),
    ]
)
