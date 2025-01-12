class VersionControl {
    var badVersion: Int?
    func isBadVersion(_ version: Int) -> Bool {
        guard let badVersion else { return false }
        return version >= badVersion
    }
}
