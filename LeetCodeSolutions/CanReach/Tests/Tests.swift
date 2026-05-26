import Testing
@testable import CanReach

@Test(arguments: [
    ("011010", 2, 3, true),
    ("01101110", 2, 3, false),
])
func canReach(_ s: String, _ minJump: Int, _ maxJump: Int, result: Bool) {
    #expect(Solution().canReach(s, minJump, maxJump) == result)
}
