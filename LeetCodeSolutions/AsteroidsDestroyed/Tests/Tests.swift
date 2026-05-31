import Testing
@testable import AsteroidsDestroyed

@Test(arguments: [
    (10, [3,9,19,5,21], true),
    (5, [4,9,23,4], false),
])
func asteroidsDestroyed(_ mass: Int, _ asteroids: [Int], _ output: Bool) {
    #expect(Solution().asteroidsDestroyed(mass, asteroids) == output)
}
