import Testing
@testable import FindDifferentBinaryString

@Test(arguments: [
    ["01","10"],
    ["00","10"],
    ["111","011","001"],
])
func test(input: [String]) async throws {
    let output = Solution().findDifferentBinaryString(input)
    #expect(!input.contains(output))
}
