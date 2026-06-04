// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TotalWavinessOfNumbersInRange1",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "TotalWavinessOfNumbersInRange1",
            path: "Sources"
        ),
        .testTarget(
            name: "TotalWavinessOfNumbersInRange1Tests",
            dependencies: ["TotalWavinessOfNumbersInRange1"],
            path: "Tests"
        ),
    ]
)
