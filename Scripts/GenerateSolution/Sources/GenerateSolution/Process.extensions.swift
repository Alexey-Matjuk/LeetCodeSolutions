import Foundation
@preconcurrency import PathKit

extension Process {
    static func openInXcode(_ file: Path) async throws {
        try await openWithArguments(["-a", "Xcode", file.absolute().string])
    }

    static func open(_ url: URL) async throws {
        try await openWithArguments([url.absoluteString, "-n"])
    }

    static func openWithArguments(_ arguments: [String]) async throws {
        let process = Process()
        process.launchPath = "/usr/bin/open"
        process.arguments = arguments
        try await process.run()
    }

    func run() async throws {
        try await withCheckedThrowingContinuation { continuation in
            self.terminationHandler = { _ in
                continuation.resume()
            }
            do {
                try run()
            } catch {
                continuation.resume(throwing: error)
            }
        }
    }
}

private extension Task where Success == Never, Failure == Never {
    static func sleep(seconds duration: TimeInterval) async throws {
        try await sleep(nanoseconds: UInt64(duration * 1_000_000_000))
    }
}
