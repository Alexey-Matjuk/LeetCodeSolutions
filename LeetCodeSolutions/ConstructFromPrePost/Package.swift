// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ConstructFromPrePost",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "ConstructFromPrePost",
            path: "Sources"
        ),
        .testTarget(
            name: "ConstructFromPrePostTests",
            dependencies: ["ConstructFromPrePost"],
            path: "Tests"
        ),
    ]
)
