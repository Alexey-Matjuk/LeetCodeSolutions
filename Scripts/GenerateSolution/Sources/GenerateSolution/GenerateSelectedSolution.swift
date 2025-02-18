import ArgumentParser
import LeetCodeAPI

struct GenerateSelectedSolution: LeetCodeProblemCommand {
    static let configuration = CommandConfiguration(
        commandName: "selected"
    )

    @Argument(
        help: "The question slug or url for the solution to generate.",
        transform: {
            let urlComponents = $0.split(separator: "/")
            if let proplemsComponentIndex = urlComponents.firstIndex(where: { $0 == "problems" }) {
                let slugComponentIndex = urlComponents.index(after: proplemsComponentIndex)
                if urlComponents.indices ~= slugComponentIndex {
                    return String(urlComponents[slugComponentIndex])
                }
            }
            return $0
        }
    )
    var slug: String

    @Flag(name: .shortAndLong, help: "Override the solution if it already exists.")
    var override = false

    func run() async throws {
        try await run(
            problem: LeetCodeAPIClient.shared.fetchQuestion(bySlug: slug),
            override: override
        )
    }
}

