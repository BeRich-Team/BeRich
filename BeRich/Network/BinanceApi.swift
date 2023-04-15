import Foundation
enum BinanceApi {
    static let scheme = "https"
    static let host = "data.binance.com"
    enum Method: String {
        case exchangeInfo = "/api/v3/exchangeInfo"

        func url() -> URL? {
            var components = URLComponents()
            components.scheme = BinanceApi.scheme
            components.host = BinanceApi.host
            components.path = rawValue
            return components.url
        }
    }
}
