import AppKit
import ArgumentParser
import LeetCodeAPI
import Rainbow

protocol LeetCodeProblemCommand: AsyncParsableCommand {}

extension LeetCodeProblemCommand {
    func run(problem: Problem, override: Bool) async throws {
        guard let solutionName = problem.question.solutionName else {
            throw ValidationError("Failed to retrive name of the daily problem. Retry or provide it manually.")
        }
        var command = try GenerateSolutionByName.parseAsRoot(
            [solutionName]
            + (override ? ["-o"] : [])
        )
        if var asyncCommand = command as? GenerateSolutionByName {
            asyncCommand.solutionSnippet = problem.question.codeSnippet
            asyncCommand.testCasesString = problem.question.testCasesString
            asyncCommand.headerComment = problem.headerComment
            try await asyncCommand.run()
        } else {
            try command.run()
        }
        try await Process.open(problem.url)
    }
}
