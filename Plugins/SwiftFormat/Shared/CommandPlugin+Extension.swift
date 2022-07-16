import Foundation
import PackagePlugin

extension CommandPlugin {
    func formatCode(in directoryURL: URL, context: PluginToolProviding, arguments: [String]) throws {
        let tool = try context.tool(named: "swiftformat")
        let toolURL = URL(fileURLWithPath: tool.path.string)

        var processArguments = ["\(directoryURL)"]
        processArguments.append(contentsOf: arguments)

        let process = Process()
        process.executableURL = toolURL
        process.arguments = processArguments

        try process.run()
        process.waitUntilExit()

        if process.terminationReason == .exit, process.terminationStatus == 0 {
            print("Formatted the source code in \(directoryURL).")
        } else {
            let problem = "\(process.terminationReason):\(process.terminationStatus)"
            Diagnostics.error("swiftformat invocation failed: \(problem)")
        }
    }
}
