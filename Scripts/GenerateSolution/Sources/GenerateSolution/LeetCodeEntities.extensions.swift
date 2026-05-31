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
              let returnType = codeSnippet?.firstMatch(of: /\)\s*->\s*([^{]+)\{/)
                .map({ String($0.1).trimmingCharacters(in: .whitespacesAndNewlines) }),
              let solutionName
        else { return nil }

        let parameterDeclarations = String(parameters)
            .split(separator: ",")
            .compactMap { ParameterDeclaration(String($0)) }
        guard !parameterDeclarations.isEmpty else { return nil }

        let expectedResults = content
            .removingHTMLTags()
            .matches(of: /Output:?\s(.+)/)
            .map { String($0.1).removingHTMLencoding() }

        let parametersNumber = parameterDeclarations.count
        let exampleTestcases = exampleTestcases
            .split(separator: "\n")
            .chunked(into: parametersNumber)

        guard expectedResults.count == exampleTestcases.count else { return nil }

        let arguments = zip(exampleTestcases, expectedResults)
            .map { testcase, expectedResult in
                "    (\((testcase.map(String.init) + [expectedResult]).joined(separator: ", "))),"
            }
            .joined(separator: "\n")
        let functionParameters = (parameterDeclarations.map(\.functionParameter) + ["_ output: \(returnType)"])
            .joined(separator: ", ")
        let callArguments = parameterDeclarations
            .map(\.callArgument)
            .joined(separator: ", ")

        return """
        @Test(arguments: [
        \(arguments)
        ])
        func \(solutionName)(\(functionParameters)) {
            #expect(Solution().\(solutionName)(\(callArguments)) == output)
        }

        """
    }
}

private struct ParameterDeclaration {
    let externalName: String?
    let localName: String
    let type: String

    init?(_ declaration: String) {
        let parts = declaration.split(separator: ":", maxSplits: 1)
        guard parts.count == 2 else { return nil }

        let names = parts[0].split(separator: " ").map(String.init)
        guard let localName = names.last else { return nil }

        self.externalName = switch names.count {
        case 1:
            localName
        default:
            names[0] == "_" ? nil : names[0]
        }
        self.localName = localName
        self.type = parts[1].trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var functionParameter: String {
        "_ \(localName): \(type)"
    }

    var callArgument: String {
        externalName.map { "\($0): \(localName)" } ?? localName
    }
}
