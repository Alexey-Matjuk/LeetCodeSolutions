import Foundation

extension Collection where Index == Int {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map { i in
            Array(self[i..<Swift.min(i + size, count)])
        }
    }
}

extension String {
    func removingHTMLTags() -> String {
        replacing(/<[^>]+>/, with: "")
    }

    func removingHTMLencoding() -> String {
        (
            try? NSAttributedString(
                data: data(using: .utf8)!,
                options: [
                    .documentType: NSAttributedString.DocumentType.html.rawValue,
                    .characterEncoding: Encoding.utf8.rawValue
                ],
                documentAttributes: nil
            ).string
        ) ?? self
    }
}
