import Testing
@testable import TotalWavinessOfNumbersInRange1

@Test(arguments: [
    (120, 130, 3),
    (198, 202, 3),
    (4848, 4848, 2),
    (92, 161, 25)
])
func totalWaviness(_ num1: Int, _ num2: Int, _ output: Int) {
    #expect(Solution().totalWaviness(num1, num2) == output)
}
