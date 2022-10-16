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
            url: "https://github.com/nicklockwood/SwiftFormat/releases/download/0.50.1/swiftformat.artifactbundle.zip",
            checksum: "76adf04beb0ef114092729a6ce300d330a96a80561826da86230e35471fe69c0"
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
