import ArgumentParser
import LeetCodeAPI

struct GenerateDailySolution: LeetCodeProblemCommand {
    static let configuration = CommandConfiguration(
        commandName: "daily"
    )
    
    @Flag(name: .shortAndLong, help: "Override the solution if it already exists.")
    var override = false
    
    func run() async throws {
        try await run(
            problem: LeetCodeAPIClient.shared.fetchDaiylProblem(),
            override: override
        )
    }
}
