import ArgumentParser
import LeetCodeAPI
import Rainbow

struct GenerateDailySolution: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "daily"
    )
    
    @Flag(name: .shortAndLong, help: "Override the solution if it already exists.")
    var override = false
    
    func run() async throws {
        let dailyProblem = try await LeetCodeAPIClient.shared.fetchDaiylProblem()
        guard let codeSnippet = dailyProblem.question.codeSnippet,
              let solutionName = codeSnippet.solutionName else {
            throw ValidationError("Failed to retrive name of the daily problem. Retry or provide it manually.")
        }
        var command = try GenerateSolutionByName.parseAsRoot(
            [solutionName]
            + (override ? ["-o"] : [])
        )
        if var asyncCommand = command as? GenerateSolutionByName {
            asyncCommand.solutionSnippet = codeSnippet
            try await asyncCommand.run()
        } else {
            try command.run()
        }
    }
}

private extension String {
    var solutionName: String? {
        firstMatch(of: /func\s+(\w+)\s*\(/).flatMap { String($0.1) }
    }
}
