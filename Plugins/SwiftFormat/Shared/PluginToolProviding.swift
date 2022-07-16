import Foundation
import PackagePlugin

protocol PluginToolProviding {
    func tool(named name: String) throws -> PackagePlugin.PluginContext.Tool
}

extension PluginContext: PluginToolProviding {}

#if canImport(XcodeProjectPlugin)
    import XcodeProjectPlugin

    extension XcodePluginContext: PluginToolProviding {}
#endif
