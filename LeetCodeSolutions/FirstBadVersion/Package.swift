// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FirstBadVersion",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "FirstBadVersion",
            path: "Sources"
        ),
        .testTarget(
            name: "FirstBadVersionTests",
            dependencies: ["FirstBadVersion"],
            path: "Tests"
        ),
    ]
)
