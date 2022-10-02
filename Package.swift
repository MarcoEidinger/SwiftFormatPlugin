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
            url: "https://github.com/nicklockwood/SwiftFormat/releases/download/0.49.18/swiftformat.artifactbundle.zip",
            checksum: "47e8ecd01fca0ea3c21029a0ea53b3dff4eb712e6164c5c796e4c74c7facf073"


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
