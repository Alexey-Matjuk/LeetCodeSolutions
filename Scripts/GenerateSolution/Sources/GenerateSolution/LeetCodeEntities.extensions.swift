import LeetCodeAPI

extension Problem {
    var headerComment: String {
        """
        /// [\(question.id). \(question.title)](\(url.absoluteString))
        ///
        """
    }
}

extension Question {
    var solutionName: String? {
        codeSnippet?.firstMatch(of: /func\s+(\w+)\s*\(/).flatMap { String($0.1) }
    }

    var testCasesString: String? {
        guard let parameters = codeSnippet?.firstMatch(of: /\((.+)\)/)?.output.1,
              let solutionName
        else { return nil }

        let expectedResults = content
            .removingHTMLTags()
            .matches(of: /Output:?\s(.+)/)
            .map { String($0.1).removingHTMLencoding() }

        let parametersNumber = parameters.count { $0 == "," } + 1
        let exampleTestcases = exampleTestcases
            .split(separator: "\n")
            .chunked(into: parametersNumber)

        guard expectedResults.count == exampleTestcases.count else { return nil }

        return exampleTestcases
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
