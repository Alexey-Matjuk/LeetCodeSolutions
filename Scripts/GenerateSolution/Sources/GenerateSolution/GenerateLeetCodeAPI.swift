@preconcurrency import ApolloCodegenLib
import ArgumentParser
@preconcurrency import PathKit

struct GenerateLeetCodeAPI: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "leetcode-api"
    )

    func run() async throws {
        try await ApolloCodegen.build(
            with: .init(
                schemaNamespace: "Generated",
                input: ApolloCodegenConfiguration.FileInput(
                    schemaSearchPaths: ["Scripts/GenerateSolution/LeetCodeAPI/Configs/**/*.graphqls"],
                    operationSearchPaths: ["Scripts/GenerateSolution/LeetCodeAPI/Configs/**/*.graphql"]
                ),
                output: ApolloCodegenConfiguration.FileOutput(
                    schemaTypes: ApolloCodegenConfiguration.SchemaTypesFileOutput(
                        path: "Scripts/GenerateSolution/LeetCodeAPI/Sources/Generated",
                        moduleType: .embeddedInTarget(name: "LeetCodeAPI", accessModifier: .internal)
                    ),
                    operations: .inSchemaModule,
                    testMocks: .none
                ),
                options: ApolloCodegenConfiguration.OutputOptions(
                    pruneGeneratedFiles: true
                )
            )
        )
    }
}
