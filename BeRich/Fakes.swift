import Foundation

enum Fakes {
    static let tickers: [Ticker] = [
        Ticker(title: "APPLE",
               subTitle: "Apple inc.",
               price: "100$",
               priceChange: .increase(100.2)),
        Ticker(title: "GOOGLE",
               subTitle: "Google inc.",
               price: "200$",
               priceChange: .stable),
        Ticker(title: "YAHOO",
               subTitle: "Yahoo inc.",
               price: "300$",
               priceChange: .decrease(130.89)),
    ]
}
