// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Find",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "Find",
            path: "Sources"
        ),
        .testTarget(
            name: "FindTests",
            dependencies: ["Find"],
            path: "Tests"
        ),
    ]
)
