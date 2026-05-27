// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PunishmentNumber",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "PunishmentNumber",
            path: "Sources"
        ),
        .testTarget(
            name: "PunishmentNumberTests",
            dependencies: ["PunishmentNumber"],
            path: "Tests"
        ),
    ]
)
