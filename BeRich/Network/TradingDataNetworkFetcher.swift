
import Foundation

protocol TradingDataNetworkFetching {
    func getTickers(completion: @escaping (BinanceTikers?) -> Void)
}

final class TradingDataNetworkFetcher: TradingDataNetworkFetching, ObservableObject {
    private let request: NetworkRequest

    init(request: @escaping NetworkRequest) {
        self.request = request
    }

    func getTickers(completion: @escaping (BinanceTikers?) -> Void) {
        guard let url = BinanceApi.Method.exchangeInfo.url() else { return completion(nil) }
        request(url) { data in
            switch data {
            case let .success(data):
                do {
                    let binanceTickers = try decodeJSON(type: BinanceTikers.self, from: data)
                    completion(binanceTickers)
                } catch {
                    print(error)
                    completion(nil)
                }
            case let .failure(error):
                print(error)
                completion(nil)
            }
        }
    }
}

private func decodeJSON<T: Decodable>(type: T.Type, from data: Data) throws -> T {
    let decoder = JSONDecoder()
    let response = try decoder.decode(type, from: data)
    return response
}
