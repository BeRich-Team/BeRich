import Foundation

struct DetectedPattern: Equatable, Hashable {
    let pattern: CandlePattern
    let startIndex: Int
    let endIndex: Int
}
