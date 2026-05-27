// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Check",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "Check",
            path: "Sources"
        ),
        .testTarget(
            name: "CheckTests",
            dependencies: ["Check"],
            path: "Tests"
        ),
    ]
)
