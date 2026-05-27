// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TupleSameProduct",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "TupleSameProduct",
            path: "Sources"
        ),
        .testTarget(
            name: "TupleSameProductTests",
            dependencies: ["TupleSameProduct"],
            path: "Tests"
        ),
    ]
)
