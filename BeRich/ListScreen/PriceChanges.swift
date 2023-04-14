import SwiftUI

enum PriceChange {
    case increase(Double)
    case stable
    case decrease(Double)

    var color: Color {
        switch self {
        case .increase:
            return .greenMain
        case .stable:
            return .gray400
        case .decrease:
            return .redMain
        }
    }
}
