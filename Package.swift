// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FileScribePlugin",
    platforms: [
        .macOS(.v11),
        .iOS(.v14),
        .watchOS(.v7),
        .tvOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FileScribePlugin",
            targets: ["FileScribePlugin"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/0xLeif/Scribe", from: "1.0.0"),
        .package(url: "https://github.com/0xOpenBytes/o", from: "2.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "FileScribePlugin",
            dependencies: [
                "Scribe",
                "o"
            ]
        ),
        .testTarget(
            name: "FileScribePluginTests",
            dependencies: ["FileScribePlugin"]
        )
    ]
)
