import Foundation
enum BinanceApi {
    enum Method: String {
        case exchangeInfo = "/api/v3/exchangeInfo"

        func url() -> URL? {
            var components = URLComponents()
            components.scheme = scheme
            components.host = host
            components.path = rawValue
            return components.url
        }
    }
}

private let scheme = "https"
private let host = "data.binance.com"
