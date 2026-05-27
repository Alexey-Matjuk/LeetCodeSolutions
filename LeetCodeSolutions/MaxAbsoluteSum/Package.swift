// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MaxAbsoluteSum",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "MaxAbsoluteSum",
            path: "Sources"
        ),
        .testTarget(
            name: "MaxAbsoluteSumTests",
            dependencies: ["MaxAbsoluteSum"],
            path: "Tests"
        ),
    ]
)
