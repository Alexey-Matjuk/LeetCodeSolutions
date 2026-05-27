// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IsArraySpecial",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "IsArraySpecial",
            path: "Sources"
        ),
        .testTarget(
            name: "IsArraySpecialTests",
            dependencies: ["IsArraySpecial"],
            path: "Tests"
        ),
    ]
)
