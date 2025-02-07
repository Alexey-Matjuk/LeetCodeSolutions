import ArgumentParser
import Foundation
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
        guard let solutionName = dailyProblem.question.solutionName else {
            throw ValidationError("Failed to retrive name of the daily problem. Retry or provide it manually.")
        }
        var command = try GenerateSolutionByName.parseAsRoot(
            [solutionName]
            + (override ? ["-o"] : [])
        )
        if var asyncCommand = command as? GenerateSolutionByName {
            asyncCommand.solutionSnippet = dailyProblem.question.codeSnippet
            asyncCommand.testCasesString = dailyProblem.question.testCasesString
            try await asyncCommand.run()
        } else {
            try command.run()
        }
        try await open(dailyProblem)
    }
}

private extension GenerateDailySolution {
    func open(_ problem: DailyProblem) async throws {
        guard let problemURL = URL(string: "https://leetcode.com\(problem.link)")
        else { return }
        try await Process.open(problemURL)
    }
}

private extension Question {
    var solutionName: String? {
        codeSnippet?.firstMatch(of: /func\s+(\w+)\s*\(/).flatMap { String($0.1) }
    }

    var testCasesString: String? {
        guard let parameters = codeSnippet?.firstMatch(of: /\((.+)\)/)?.output.1,
              let solutionName
        else { return nil }

        let expectedResults = content
            .removingHTMLTags()
            .matches(of: /Output:\s(.+)/)
            .map(\.1)

        let parametersNumber = parameters.count { $0 == "," } + 1
        return exampleTestcases
            .split(separator: "\n")
            .chunked(into: parametersNumber)
            .enumerated()
            .map {
                """
                @Test func test\($0.offset + 1)() async throws {
                    #expect(Solution().\(solutionName)(\($0.element.joined(separator: ", "))) == \(expectedResults[$0.offset]))
                }
                """
            }
            .joined(separator: "\n\n") + "\n"
    }
}

private extension Collection where Index == Int {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map { i in
            Array(self[i..<Swift.min(i + size, count)])
        }
    }
}

extension String {
    func removingHTMLTags() -> String {
        replacing(/<[^>]+>/, with: "")
    }
}
