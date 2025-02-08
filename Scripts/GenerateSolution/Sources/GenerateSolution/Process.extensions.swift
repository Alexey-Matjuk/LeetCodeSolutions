import Foundation
@preconcurrency import PathKit

extension Process {
    static func resolveSPMDependencies(_ project: Path) async throws {
        let process = Process()
        process.currentDirectoryURL = project.url
        process.launchPath = "/usr/bin/swift"
        process.arguments = ["package", "resolve"]

        let pipe = Pipe()
        process.standardOutput = pipe
        process.standardError = pipe

        do {
            try await process.run()
        } catch {
            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            let output = String(data: data, encoding: .utf8) ?? ""
            print(output)
        }
    }

    static func openInXcode(_ file: Path) async throws {
        let process = Process()
        process.launchPath = "/usr/bin/xed"
        process.arguments = ["\(file.absolute().string)"]
        try await process.run()
    }

    static func open(_ url: URL) async throws {
        try await openWithArguments([url.absoluteString])
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
