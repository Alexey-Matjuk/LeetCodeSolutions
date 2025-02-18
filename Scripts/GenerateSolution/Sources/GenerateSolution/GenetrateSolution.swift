import ArgumentParser
@preconcurrency import PathKit
import Rainbow

@main
struct GenerateSolution: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "generate-solution",
        abstract: "A command to generate a new LeetCode solution subpackage.",
        subcommands: [
            GenerateSolutionByName.self,
            GenerateLeetCodeAPI.self,
            GenerateDailySolution.self,
            GenerateSelectedSolution.self
        ],
        defaultSubcommand: GenerateSolutionByName.self
    )

    /// - Note: Not used for this command
    @Flag(name: .shortAndLong, help: "Build script for generating LeetCode solution subpackages.")
    var buildScript = false
}
