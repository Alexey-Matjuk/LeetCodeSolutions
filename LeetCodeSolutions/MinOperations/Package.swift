// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MinOperations",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "MinOperations",
            path: "Sources"
        ),
        .testTarget(
            name: "MinOperationsTests",
            dependencies: ["MinOperations"],
            path: "Tests"
        ),
    ]
)
