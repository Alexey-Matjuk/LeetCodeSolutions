// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EventualSafeNodes",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "EventualSafeNodes",
            path: "Sources"
        ),
        .testTarget(
            name: "EventualSafeNodesTests",
            dependencies: ["EventualSafeNodes"],
            path: "Tests"
        ),
    ]
)
