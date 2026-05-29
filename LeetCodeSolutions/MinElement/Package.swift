// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MinElement",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "MinElement",
            path: "Sources"
        ),
        .testTarget(
            name: "MinElementTests",
            dependencies: ["MinElement"],
            path: "Tests"
        ),
    ]
)
