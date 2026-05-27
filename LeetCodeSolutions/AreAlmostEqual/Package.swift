// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AreAlmostEqual",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "AreAlmostEqual",
            path: "Sources"
        ),
        .testTarget(
            name: "AreAlmostEqualTests",
            dependencies: ["AreAlmostEqual"],
            path: "Tests"
        ),
    ]
)
