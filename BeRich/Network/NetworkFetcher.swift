//
//  NetworkFetcher.swift
//  BeRich
//
//  Created by Matvei Bykadorov on 13.04.2023.
//

import Foundation

protocol INetworkFetcher {
    func getTickers(result: @escaping (BinanceTikers?) -> Void)
}

final class NetworkFetcher: INetworkFetcher, ObservableObject {
    let network: INetworkManager

    init(network: INetworkManager) {
        self.network = network
    }

    func getTickers(result: @escaping (BinanceTikers?) -> Void) {
        network.request(path: "https://data.binance.com/api/v3/exchangeInfo", params: nil) { [weak self] data, response, error in
            if let error {
                print(error)
                result(nil)
            }
            if let response = (response as? HTTPURLResponse) {
                print(response.statusCode)
            }
            let binanceTickers = self?.decodeJSON(type: BinanceTikers.self, from: data)
            result(binanceTickers)
        }
    }

    private func decodeJSON<T: Decodable>(type: T.Type, from data: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data, let response = try? decoder.decode(type, from: data) else { return nil }
        return response
    }
}
