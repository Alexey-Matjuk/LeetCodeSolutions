// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RecoverFromPreorder",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "RecoverFromPreorder",
            path: "Sources"
        ),
        .testTarget(
            name: "RecoverFromPreorderTests",
            dependencies: ["RecoverFromPreorder"],
            path: "Tests"
        ),
    ]
)
