// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PartitionArrayAccordingToGivenPivot",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "PartitionArrayAccordingToGivenPivot",
            path: "Sources"
        ),
        .testTarget(
            name: "PartitionArrayAccordingToGivenPivotTests",
            dependencies: ["PartitionArrayAccordingToGivenPivot"],
            path: "Tests"
        ),
    ]
)
