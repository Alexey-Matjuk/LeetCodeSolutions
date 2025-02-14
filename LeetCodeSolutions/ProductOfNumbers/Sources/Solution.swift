/// [1352. Product of the Last K Numbers](https://leetcode.com/problems/product-of-the-last-k-numbers/)
///
/// - Space complexity: O(n)
class ProductOfNumbers {
    private var products = [Int]()

    init() {}

    /// - Time complexity: O(1)
    func add(_ num: Int) {
        guard num != 0 else {
            products = []
            return
        }
        guard let lastProduct = products.last else {
            products.append(num)
            return
        }
        products.append(lastProduct * num)
    }

    /// - Time complexity: O(1)
    func getProduct(_ k: Int) -> Int {
        switch products.count {
        case ..<k:
            0
        case k:
            products[products.endIndex - 1]
        default:
            products[products.endIndex - 1] / products[products.endIndex - k - 1]
        }
    }
}

/**
 * Your ProductOfNumbers object will be instantiated and called as such:
 * let obj = ProductOfNumbers()
 * obj.add(num)
 * let ret_2: Int = obj.getProduct(k)
 */
