import Apollo
import ApolloAPI
import Foundation

public actor LeetCodeAPIClient {
    public static let shared = LeetCodeAPIClient()
    private let client = ApolloClient(url: .init(string: "https://leetcode.com/graphql")!)

    public func fetchDaiylProblem() async throws -> DailyProblem {
        try await withCheckedThrowingContinuation { continuation in
            client.fetch(query: Generated.DailyProblemQuery()) { result in
                switch result {
                case .success(let result):
                    guard let dailyProblem = result.data?.activeDailyCodingChallengeQuestion else {
                        continuation.resume(throwing: FetchingError(target: "Daily Problem"))
                        return
                    }
                    continuation.resume(returning: DailyProblem(dailyProblem))
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

private struct FetchingError: LocalizedError, Hashable {
    let fetchingTarget: String

    init(target: String) {
        fetchingTarget = target
    }

    var errorDescription: String? {
        "Failed to fetch \(fetchingTarget)."
    }
}

private extension DailyProblem {
    init(_ dailyProblem: Generated.DailyProblemQuery.Data.ActiveDailyCodingChallengeQuestion) {
        self.url = URL(string: "https://leetcode.com\(dailyProblem.link)")!
        let question = dailyProblem.question
        self.question = .init(
            id: question.questionFrontendId,
            title: question.title,
            titleSlug: question.titleSlug,
            content: question.content,
            difficulty: question.difficulty,
            exampleTestcases: question.exampleTestcases,
            topicTags: question.topicTags.compactMap {
                .init(
                    name: $0.name,
                    slug: $0.slug,
                    translatedName: $0.translatedName
                )
            },
            codeSnippet: question.codeSnippets.first { $0.langSlug == .swift }?.code
        )
    }
}
