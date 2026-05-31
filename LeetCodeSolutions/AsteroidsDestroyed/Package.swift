// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AsteroidsDestroyed",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "AsteroidsDestroyed",
            path: "Sources"
        ),
        .testTarget(
            name: "AsteroidsDestroyedTests",
            dependencies: ["AsteroidsDestroyed"],
            path: "Tests"
        ),
    ]
)
