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
            url: "https://github.com/nicklockwood/SwiftFormat/releases/download/0.50.0/swiftformat.artifactbundle.zip",
            checksum: "7b2e20261530433ba613d96332ada3bd52bfd19b1296d4d929e61338dfd7e9cc"
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
