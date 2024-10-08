// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DekiParser",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DekiParser",
            targets: ["DekiParser"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jpsim/Yams.git", "5.1.3"..<"6.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DekiParser",
            dependencies: ["Yams"]
        ),
        .testTarget(
            name: "DekiParserTests",
            dependencies: ["DekiParser"],
            resources: [.process("Resources")]
        ),
    ]
)
