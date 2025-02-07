public struct Question: Sendable {
    public let id: String
    public let title: String
    public let titleSlug: String
    public let content: String
    public let difficulty: String
    public let exampleTestcases: String
    public let topicTags: [TopicTag]
    public let codeSnippet: String?
}
