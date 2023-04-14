import SwiftUI

struct Ticker: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let subTitle: String
    let price: String
    let priceChange: PriceChange
}
