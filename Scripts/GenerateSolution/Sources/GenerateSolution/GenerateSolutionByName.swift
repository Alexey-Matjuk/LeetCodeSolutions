import ArgumentParser
import Foundation
import GenesisKit
@preconcurrency import PathKit
import Rainbow

struct GenerateSolutionByName: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "name"
    )

    @Argument(
        help: "The name of the solution to generate.",
        transform: \.uppercasedFirstLetter
    )
    var solutionName: String

    @Flag(name: .shortAndLong, help: "Override the solution if it already exists.")
    var override = false

    var solutionSnippet: String?
    var headerComment: String?
    var testCasesString: String?

    func run() async throws {
        print("Generating \(solutionName) subpackage...")

        try generateSolution()
        try updatePackageFile()
        try await openPackage()
        try await openSolution()

        print("Generation complete!".green)
    }
}

private extension GenerateSolutionByName {
    static let projectPath = Path("LeetCodeSolutions")

    func generateSolution() throws {
        let outputPath = GenerateSolutionByName.projectPath + solutionName

        if outputPath.exists {
            guard override else {
                throw ValidationError("Solution already exists at \(outputPath.string). Use --override to replace it.")
            }
            print("Solution already exists at \(outputPath.string).\nOverriding...".yellow)
            try outputPath.delete()
        }

        var template = try GenesisTemplate(path: .current + "Templates/LeetCodeSolution.yml")
        solutionSnippet.flatMap { template.replaceSolutionWithSnippet($0) }
        headerComment.flatMap { template.addSolutionHeaderComment($0) }
        testCasesString.flatMap { template.replaceTestCases(with: $0) }

        try TemplateGenerator(template: template)
            .generate(context: ["solution_name": solutionName], interactive: false)
            .writeFiles(path: outputPath)
    }

    func updatePackageFile() throws {
        let solutions = GenerateSolutionByName.projectPath
            .iterateChildren(options: [.skipsHiddenFiles, .skipsSubdirectoryDescendants])
            .compactMap { $0.isDirectory ? $0.lastComponent : nil }
            .sorted()

        let packageFilePath = GenerateSolutionByName.projectPath + "Package.swift"
        var packageFileContent = try String(contentsOf: packageFilePath.url, encoding: .utf8)
        packageFileContent.replace(
            /let solutions[^\]]*\]/,
            with: "let solutions = [\n\(solutions.map { "    \"\($0)\",\n" }.joined())]"
        )
        try packageFileContent.write(to: packageFilePath.url, atomically: true, encoding: .utf8)
    }

    func openPackage() async throws {
        try await Process.openInXcode(
            GenerateSolutionByName.projectPath + "Package.swift"
        )
    }

    func openSolution() async throws {
        try await Process.openInXcode(
            GenerateSolutionByName.projectPath + "\(solutionName)/Sources/Solution.swift"
        )
    }
}

private extension File {
    mutating
    func transformContent(_ transform: (String) -> String) {
        switch type {
        case .contents(let contents):
            type = .contents(transform(contents))
        default: break
        }
    }
}

private extension GenesisTemplate {
    mutating
    func transformContentOfFile(_ fileName: String, transform: (String) -> String) {
        guard let fileIndex = section.files.firstIndex(where: {
            $0.path.hasSuffix(fileName)
        }) else { return }
        section.files[fileIndex].transformContent(transform)
    }

    mutating
    func replaceContentOfFile(
        _ fileName: String,
        after searchString: String,
        with newContent: String
    ) {
        transformContentOfFile(fileName) { content in
            content
                .ranges(of: searchString).first
                .flatMap {
                    content.replacingCharacters(
                        in: $0.lowerBound..<content.endIndex,
                        with: newContent
                    )
                }
            ?? content
        }
    }

    mutating
    func addSolutionHeaderComment(_ headerComment: String) {
        transformContentOfFile("Solution.swift") {
            headerComment + "\n" + $0
        }
    }
    mutating
    func replaceSolutionWithSnippet(_ snippet: String) {
        replaceContentOfFile(
            "Solution.swift",
            after: "class Solution",
            with: snippet
        )
    }

    mutating
    func replaceTestCases(with testCasesString: String) {
        replaceContentOfFile(
            "Tests.swift",
            after: "@Test",
            with: testCasesString
        )
    }
}

private extension String {
    var uppercasedFirstLetter: String {
        first.flatMap { $0.uppercased() + dropFirst() } ?? self
    }
}
