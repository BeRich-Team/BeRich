
import Foundation

protocol TradingDataNetworkFetching {
    func getBinanceTickers() async -> BinanceTiсkers?
    func getMoexTickers() async -> [Ticker]?
}

final class TradingDataNetworkFetcher: TradingDataNetworkFetching, ObservableObject {
    func getBinanceTickers() async -> BinanceTiсkers? {
        guard let url = BinanceApi.Method.exchangeInfo.url() else {
            assertionFailure()
            return nil
        }
        print(url)
        do {
            let data = try await request(url)
            let binanceTickers = try decodeJSON(type: BinanceTiсkers.self, from: data)
            return binanceTickers
        } catch {
            print(error)
        }
        return nil
    }

    func getBinanceCandles(queryItems _: [URLQueryItem]?) async -> BinanceCandles? {
        guard let url = BinanceApi.Method.candles.url() else {
            assertionFailure()
            return nil
        }
        print(url)
        do {
            let data = try await request(url)
            let binanceCandles = try decodeJSON(type: BinanceCandles.self, from: data)
            return binanceCandles
        } catch {
            print(error)
        }
        return nil
    }

    func getMoexTickers() async -> [Ticker]? {
        guard let url = MoexApi.Method.allTiсkers.url(tiсker: nil) else {
            assertionFailure()
            return nil
        }
        print(url)
        do {
            let data = try await request(url)
            let moexTickers = try decodeJSON(type: MoexTiсkers.self, from: data)
            print(moexTickers)
            let tickers = parseMoexTikers(moexTickers: moexTickers)
            return tickers
        } catch {
            print(error)
        }
        return nil
    }

    func getMoexCandles(ticker: String, queryItems: [URLQueryItem]) async -> [Stock]? {
        guard let url = MoexApi.Method.candles.url(tiсker: ticker, queryItems: queryItems) else {
            assertionFailure()
            return nil
        }
        print(url)
        do {
            let data = try await request(url)
            let moexCandles = try decodeJSON(type: MoexCandles.self, from: data)
            let stocks = parseMoexCandles(moexCandles: moexCandles)
            return stocks
        } catch {
            print(error)
        }
        return nil
    }
}

private func decodeJSON<T: Decodable>(type: T.Type, from data: Data) throws -> T {
    let decoder = JSONDecoder()
    let response = try decoder.decode(type, from: data)
    return response
}

private func request(_ url: URL) async throws -> Data {
    if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
        print("from cach")
        return cachedResponse.data
    }
    let session = URLSession(configuration: .default)
    let (data, response) = try await session.data(for: URLRequest(url: url))
    guard let httpURLResponse = response.httpURLResponse, httpURLResponse.isSuccessful else {
        throw NetworkingError.requestFailed
    }
    print(httpURLResponse.statusCode)
    print(httpURLResponse.allHeaderFields)
    let cachedResponse = CachedURLResponse(response: response, data: data)
    URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: url))
    print("from network")
    return data
}

private func parseMoexTikers(moexTickers: MoexTiсkers) -> [Ticker] {
    var tickers = [Ticker]()
    for i in 0 ..< moexTickers.history.data.count {
        var title = ""
        let shortName = moexTickers.history.data[i][3]
        switch shortName {
        case let .string(string):
            title = string
        default:
            break
        }
        var subTitle = ""
        let fullName = moexTickers.history.data[i][2]
        switch fullName {
        case let .string(string):
            subTitle = string
        default:
            break
        }
        var closePrice = 0.0
        let value = moexTickers.history.data[i][11]
        switch value {
        case let .double(double):
            closePrice = double
        default:
            break
        }

        var openPrice = 0.0
        let openValue = moexTickers.history.data[i][6]
        switch openValue {
        case let .double(double):
            openPrice = double
        default:
            break
        }
        guard openPrice != 0 else { continue }

        let priceChange = closePrice - openPrice
        let ticker = Ticker(title: title, subTitle: subTitle, price: Money(amount: closePrice, currency: .rub), priceChange: Money(amount: priceChange, currency: .rub))
        tickers.append(ticker)
    }
    return tickers
}

private func parseMoexCandles(moexCandles: MoexCandles) -> [Stock] {
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()

    var stocks = [Stock]()
    for i in 0 ..< moexCandles.candles.data.count {
        var date = ""
        let rawDate = moexCandles.candles.data[i][6]
        switch rawDate {
        case let .string(string):
            date = string
        default:
            break
        }
        var openPrice = 0.0
        let openValue = moexCandles.candles.data[i][0]
        switch openValue {
        case let .double(double):
            openPrice = double
        default:
            break
        }
        var closePrice = 0.0
        let closeValue = moexCandles.candles.data[i][1]
        switch closeValue {
        case let .double(double):
            closePrice = double
        default:
            break
        }
        var highPrice = 0.0
        let highValue = moexCandles.candles.data[i][1]
        switch highValue {
        case let .double(double):
            highPrice = double
        default:
            break
        }
        var lowPrice = 0.0
        let lowValue = moexCandles.candles.data[i][1]
        switch lowValue {
        case let .double(double):
            lowPrice = double
        default:
            break
        }
        let stock = Stock(date: dateFormatter.date(from: date) ?? Date(), openPrice: openPrice, closePrice: closePrice, highPrice: highPrice, lowPrice: lowPrice)
        stocks.append(stock)
    }
    return stocks
}

enum NetworkingError: Error {
    case requestFailed
}

extension URLResponse {
    /// Returns casted HTTPURLResponse
    var httpURLResponse: HTTPURLResponse? {
        self as? HTTPURLResponse
    }
}

extension HTTPURLResponse {
    /// Returns true if statusCode is in range 200...299.
    /// Otherwise false.
    var isSuccessful: Bool {
        200 ... 299 ~= statusCode
    }
}
