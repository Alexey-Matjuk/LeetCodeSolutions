// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GridGame",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "GridGame",
            path: "Sources"
        ),
        .testTarget(
            name: "GridGameTests",
            dependencies: ["GridGame"],
            path: "Tests"
        ),
    ]
)
