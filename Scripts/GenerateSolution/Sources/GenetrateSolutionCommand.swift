import ArgumentParser
import GenesisKit
@preconcurrency import PathKit
import Rainbow

@main
struct GenerateSolutionCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "generate-solution",
        abstract: "A command to generate a new LeetCode solution subpackage."
    )

    @Argument(help: "The name of the solution to generate.", transform: \.uppercasedFirstLetter)
    var solutionName: String

    @Flag(name: .shortAndLong, help: "Override the solution if it already exists.")
    var override = false

    /// - Note: Not used for this command
    @Flag(name: .shortAndLong, help: "Build script for generating LeetCode solution subpackages.")
    var buildScript = false

    func run() throws {
        print("Generating \(solutionName) subpackage...")

        try generateSolution()
        try updatePackageFile()

        print("Generation complete!".green)
    }
}

private extension GenerateSolutionCommand {
    static let projectPath = Path("LeetCodeSolutions")

    func generateSolution() throws {
        let outputPath = Self.projectPath + solutionName

        if outputPath.exists {
            guard override else {
                throw ValidationError("Solution already exists at \(outputPath.string). Use --override to replace it.")
            }
            print("Solution already exists at \(outputPath.string). Overriding...".yellow)
            try outputPath.delete()
        }

        let template = try GenesisTemplate(path: .current + "Templates/LeetCodeSolution.yml")
        try TemplateGenerator(template: template)
            .generate(context: ["solution_name": solutionName], interactive: false)
            .writeFiles(path: outputPath)
    }

    func updatePackageFile() throws {
        let solutions = Self.projectPath
            .iterateChildren(options: [.skipsHiddenFiles, .skipsSubdirectoryDescendants])
            .compactMap { $0.isDirectory ? $0.lastComponent : nil }
            .sorted()

        let packageFilePath = Self.projectPath + "Package.swift"
        var packageFileContent = try String(contentsOf: packageFilePath.url, encoding: .utf8)
        packageFileContent.replace(
            /let solutions[^\]]*\]/,
            with: "let solutions = [\n\(solutions.map { "    \"\($0)\",\n" }.joined())]"
        )
        try packageFileContent.write(to: packageFilePath.url, atomically: true, encoding: .utf8)
    }
}

private extension String {
    var uppercasedFirstLetter: String {
        first.flatMap { $0.uppercased() + dropFirst() } ?? self
    }
}
