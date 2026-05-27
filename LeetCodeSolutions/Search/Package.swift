// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Search",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "Search",
            path: "Sources"
        ),
        .testTarget(
            name: "SearchTests",
            dependencies: ["Search"],
            path: "Tests"
        ),
    ]
)
