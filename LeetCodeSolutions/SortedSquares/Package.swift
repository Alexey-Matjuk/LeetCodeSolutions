// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SortedSquares",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "SortedSquares",
            path: "Sources"
        ),
        .testTarget(
            name: "SortedSquaresTests",
            dependencies: ["SortedSquares"],
            path: "Tests"
        ),
    ]
)
