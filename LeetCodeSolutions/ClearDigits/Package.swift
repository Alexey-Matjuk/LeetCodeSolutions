// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ClearDigits",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "ClearDigits",
            path: "Sources"
        ),
        .testTarget(
            name: "ClearDigitsTests",
            dependencies: ["ClearDigits"],
            path: "Tests"
        ),
    ]
)
