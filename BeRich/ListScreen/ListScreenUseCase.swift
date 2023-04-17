//
//  ListScreenUseCase.swift
//  BeRich
//
//  Created by Danila on 16.04.2023.
//

import Foundation

protocol ListScreenUseCase {
    func getTickers() async throws -> [Ticker]
}

final class ListScreenUseCaseImpl: ListScreenUseCase {
    let fetcher: TradingDataNetworkFetching

    init(fetcher: TradingDataNetworkFetching) {
        self.fetcher = fetcher
    }

    func getTickers() async throws -> [Ticker] {
        guard let data = await fetcher.getTickers() else { throw ListScreenErrors.loading }
        return data.asModelTickers
    }
}

extension BinanceTikers {
    var asModelTickers: [Ticker] {
        symbols
            .filter { $0.tradingSessionStatus == .trading }
            .map { Ticker(title: $0.symbol, subTitle: "Nil", price: "0", priceChange: 0) }
    }
}
