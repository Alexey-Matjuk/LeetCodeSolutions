// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ApplyOperations",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "ApplyOperations",
            path: "Sources"
        ),
        .testTarget(
            name: "ApplyOperationsTests",
            dependencies: ["ApplyOperations"],
            path: "Tests"
        ),
    ]
)
