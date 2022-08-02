import Foundation
import PackagePlugin

@main
struct SwiftFormatPlugin: CommandPlugin {
    /// This entry point is called when operating on a Swift package.
    func performCommand(context: PluginContext, arguments: [String]) throws {
        if arguments.contains("--verbose") {
            print("Command plugin execution with arguments \(arguments.description) for Swift package \(context.package.displayName). All target information: \(context.package.targets.description)")
        }

        var targetsToProcess: [Target] = context.package.targets

        var argExtractor = ArgumentExtractor(arguments)

        let selectedTargets = argExtractor.extractOption(named: "target")

        if selectedTargets.isEmpty == false {
            targetsToProcess = context.package.targets.filter { selectedTargets.contains($0.name) }.map { $0 }
        }

        for target in targetsToProcess {
            guard let target = target as? SourceModuleTarget else { continue }

            try formatCode(in: target.directory, context: context, arguments: argExtractor.remainingArguments)
        }
    }
}
