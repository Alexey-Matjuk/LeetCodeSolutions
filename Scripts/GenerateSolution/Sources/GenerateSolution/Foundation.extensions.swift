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

    var integerFromRomanNumeral: Int? {
        let values: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]

        var total = 0
        var previousValue = 0

        for character in uppercased().reversed() {
            guard let value = values[character] else { return nil }

            if value < previousValue {
                total -= value
            } else {
                total += value
                previousValue = value
            }
        }

        return total
    }
}
