// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "СountServers",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "СountServers",
            path: "Sources"
        ),
        .testTarget(
            name: "СountServersTests",
            dependencies: ["СountServers"],
            path: "Tests"
        ),
    ]
)
