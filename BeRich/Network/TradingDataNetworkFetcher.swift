
import Foundation

protocol NetworkFetching {
    func getTickers(completion: @escaping (BinanceTikers?) -> Void)
}

final class TradingDataNetworkFetcher: NetworkFetching, ObservableObject {
    private let request: NetworkRequest
    
    init(request: @escaping NetworkRequest) {
        self.request = request
    }
    
    func getTickers(completion: @escaping (BinanceTikers?) -> Void) {
        guard let url = URL(string: Exchange.Binance.RequestType.exchangeInfo.rawValue) else { return completion(nil) }
        request(url) { data in
            switch data {
                case .success(let data):
                    do {
                        let binanceTickers = try decodeJSON(type: BinanceTikers.self, from: data)
                        completion(binanceTickers)
                    } catch (let error) {
                        print(error)
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}

fileprivate func decodeJSON<T: Decodable>(type: T.Type, from data: Data) throws -> T {
    let decoder = JSONDecoder()
    let response = try decoder.decode(type, from: data)
    return response
}

enum Exchange {
    struct Binance {
        enum RequestType: String {
            case exchangeInfo = "https://data.binance.com/api/v3/exchangeInfo"
        }
    }
    struct Moex {
        enum RequestType {
            
        }
    }
}
