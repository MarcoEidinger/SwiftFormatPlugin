# SwiftFormatPlugin

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FMarcoEidinger%2FSwiftFormatPlugin%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/MarcoEidinger/SwiftFormatPlugin)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FMarcoEidinger%2FSwiftFormatPlugin%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/MarcoEidinger/SwiftFormatPlugin)

A Swift Package Plugin to format source code with [SwiftFormat](https://github.com/nicklockwood/SwiftFormat).

## Add to Package

Add the package to your dependencies.

```swift
dependencies: [
    // ...
    .package(url: "https://github.com/MarcoEidinger/SwiftFormatPlugin", from: "0.49.16"),
]
```

Note: the version matches a [SwiftFormat release](https://github.com/nicklockwood/SwiftFormat/releases).

## Run Plugin

### SPM

```bash
swift package plugin --allow-writing-to-package-directory format-source-code
```

You can limit the formatting to a particular target with `--target` option.

You can also specify SwiftFormat arguments such as `--swiftversion`.

Example

```bash
swift package plugin --allow-writing-to-package-directory format-source-code --target MyLibrary --swiftversion 5.6 --verbose
```

### Xcode

In Xcode 14 you can trigger the command plugin execution for a Swift package or an Xcode project.

For an Xcode project the project's main directory will be processed and the `--target` option will be ignored.

You can also specify SwiftFormat arguments such as `--swiftversion`.

![Run plugin in Xcode 14](https://user-images.githubusercontent.com/4176826/179352584-db7f7f42-452c-4a42-a329-01b115a237a7.gif)
