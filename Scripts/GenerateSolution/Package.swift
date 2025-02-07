// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GenerateSolution",
    platforms: [.macOS(.v15)],
    products: [
        .executable(
            name: "GenerateSolution",
            targets: ["GenerateSolution"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/yonaskolb/Genesis",
            .upToNextMajor(from: "0.9.0")
        ),
        .package(
            url: "https://github.com/apple/swift-argument-parser.git",
            .upToNextMajor(from: "1.5.0")
        ),
        .package(
            url: "https://github.com/apollographql/apollo-ios-codegen",
            .upToNextMajor(from: "1.17.0")
        ),
        .package(path: "LeetCodeAPI")
    ],
    targets: [
        .executableTarget(
            name: "GenerateSolution",
            dependencies: [
                .product(name: "GenesisKit", package: "Genesis"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "ApolloCodegenLib", package: "apollo-ios-codegen"),
                "LeetCodeAPI",
            ]
        ),
    ]
)
