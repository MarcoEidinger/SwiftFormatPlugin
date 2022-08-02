// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "SwiftFormatPlugin",
    products: [
        .plugin(name: "SwiftFormat", targets: ["SwiftFormat"]),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "swiftformat",
            url: "https://github.com/nicklockwood/SwiftFormat/releases/download/0.49.13/swiftformat.artifactbundle.zip",
            checksum: "5ce27780dceee8714b15d53141e6dce1a8d626e970eade3c511c9ef1a0c06f40"
        ),
        .plugin(name: "SwiftFormat",
                capability: .command(
                    intent: .sourceCodeFormatting(),
                    permissions: [
                        .writeToPackageDirectory(reason: "This command reformats source files"),
                    ]
                ),
                dependencies: [.target(name: "swiftformat")]),
    ]
)
