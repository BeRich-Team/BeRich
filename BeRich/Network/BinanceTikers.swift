
import Foundation

struct BinanceTikers: Decodable {
    struct Symbol: Decodable {
        var symbol: String
        var tradingSessionStatus: Status

        private enum CodingKeys: String, CodingKey {
            case symbol, tradingSessionStatus = "status"
        }
    }

    enum Status: String, Decodable {
        case noTrading = "BREAK"
        case trading = "TRADING"
    }

    let timezone: String
    let serverTime: Int
    let symbols: [Symbol]
}
