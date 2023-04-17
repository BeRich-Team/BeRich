import Foundation

enum Fakes {
    static let tickers: [Ticker] = [
        Ticker(title: "APPLE",
               subTitle: "Apple inc.",
               price: "100$",
               priceChange: 100.2),
        Ticker(title: "GOOGLE",
               subTitle: "Google inc.",
               price: "200$",
               priceChange: 0.0),
        Ticker(title: "YAHOO",
               subTitle: "Yahoo inc.",
               price: "300$",
               priceChange: -130.89),
    ]

    static let defaultStocks: [Stock] = [
        Stock(date: "03/06/2023", openPrice: 153.785, closePrice: 153.83, highPrice: 156.30, lowPrice: 153.46),
        Stock(date: "03/07/2023", openPrice: 153.70, closePrice: 151.60, highPrice: 154.0299, lowPrice: 151.13),
        Stock(date: "03/08/2023", openPrice: 152.81, closePrice: 152.87, highPrice: 153.47, lowPrice: 151.83),
        Stock(date: "03/09/2023", openPrice: 153.559, closePrice: 150.59, highPrice: 154.535, lowPrice: 150.225),
        Stock(date: "03/10/2023", openPrice: 150.21, closePrice: 148.50, highPrice: 150.94, lowPrice: 147.6096),
        Stock(date: "03/11/2023", openPrice: 150.21, closePrice: 148.50, highPrice: 150.94, lowPrice: 147.6096),
        Stock(date: "03/12/2023", openPrice: 150.21, closePrice: 148.50, highPrice: 150.94, lowPrice: 147.6096),
        Stock(date: "03/13/2023", openPrice: 147.805, closePrice: 150.47, highPrice: 153.14, lowPrice: 147.70),
        Stock(date: "03/14/2023", openPrice: 151.28, closePrice: 152.59, highPrice: 153.40, lowPrice: 150.10),
        Stock(date: "03/15/2023", openPrice: 151.19, closePrice: 152.99, highPrice: 153.245, lowPrice: 149.92),
        Stock(date: "03/16/2023", openPrice: 152.16, closePrice: 155.85, highPrice: 156.46, lowPrice: 151.64),
        Stock(date: "03/17/2023", openPrice: 156.08, closePrice: 155.00, highPrice: 156.74, lowPrice: 154.28),
        Stock(date: "03/18/2023", openPrice: 156.08, closePrice: 155.00, highPrice: 156.74, lowPrice: 154.28),
        Stock(date: "03/19/2023", openPrice: 156.08, closePrice: 155.00, highPrice: 156.74, lowPrice: 154.28),
        Stock(date: "03/20/2023", openPrice: 155.07, closePrice: 157.40, highPrice: 157.82, lowPrice: 154.15),
        Stock(date: "03/21/2023", openPrice: 157.32, closePrice: 159.28, highPrice: 159.40, lowPrice: 156.54),
        Stock(date: "03/22/2023", openPrice: 159.30, closePrice: 157.83, highPrice: 162.14, lowPrice: 157.81),
        Stock(date: "03/23/2023", openPrice: 158.83, closePrice: 158.93, highPrice: 161.5501, lowPrice: 157.68),
        Stock(date: "03/24/2023", openPrice: 158.86, closePrice: 160.25, highPrice: 160.34, lowPrice: 157.85),
        Stock(date: "03/25/2023", openPrice: 158.86, closePrice: 160.25, highPrice: 160.34, lowPrice: 157.85),
        Stock(date: "03/26/2023", openPrice: 158.86, closePrice: 160.25, highPrice: 160.34, lowPrice: 157.85),
        Stock(date: "03/27/2023", openPrice: 159.94, closePrice: 158.28, highPrice: 160.77, lowPrice: 157.87),
        Stock(date: "03/28/2023", openPrice: 157.97, closePrice: 157.65, highPrice: 158.49, lowPrice: 155.98),
        Stock(date: "03/29/2023", openPrice: 159.37, closePrice: 160.77, highPrice: 161.05, lowPrice: 159.35),
        Stock(date: "03/30/2023", openPrice: 161.53, closePrice: 162.36, highPrice: 162.47, lowPrice: 161.271),
        Stock(date: "03/31/2023", openPrice: 162.44, closePrice: 164.90, highPrice: 165.00, lowPrice: 161.91),
        Stock(date: "04/01/2023", openPrice: 162.44, closePrice: 164.90, highPrice: 165.00, lowPrice: 161.91),
        Stock(date: "04/02/2023", openPrice: 162.44, closePrice: 164.90, highPrice: 165.00, lowPrice: 161.91),
        Stock(date: "04/03/2023", openPrice: 164.27, closePrice: 166.17, highPrice: 166.29, lowPrice: 164.22),
        Stock(date: "04/04/2023", openPrice: 164.27, closePrice: 166.17, highPrice: 166.29, lowPrice: 164.22),
        Stock(date: "04/05/2023", openPrice: 164.27, closePrice: 166.17, highPrice: 166.29, lowPrice: 164.22),
        Stock(date: "04/06/2023", openPrice: 153.785, closePrice: 153.83, highPrice: 156.30, lowPrice: 153.46),
        Stock(date: "04/07/2023", openPrice: 153.70, closePrice: 151.60, highPrice: 154.0299, lowPrice: 151.13),
        Stock(date: "04/08/2023", openPrice: 152.81, closePrice: 152.87, highPrice: 153.47, lowPrice: 151.83),
        Stock(date: "04/09/2023", openPrice: 153.559, closePrice: 150.59, highPrice: 154.535, lowPrice: 150.225),
        Stock(date: "04/10/2023", openPrice: 150.21, closePrice: 148.50, highPrice: 150.94, lowPrice: 147.6096),
        Stock(date: "04/11/2023", openPrice: 150.21, closePrice: 148.50, highPrice: 150.94, lowPrice: 147.6096),
        Stock(date: "04/12/2023", openPrice: 150.21, closePrice: 148.50, highPrice: 150.94, lowPrice: 147.6096),
        Stock(date: "04/13/2023", openPrice: 147.805, closePrice: 150.47, highPrice: 153.14, lowPrice: 147.70),
        Stock(date: "04/14/2023", openPrice: 151.28, closePrice: 152.59, highPrice: 153.40, lowPrice: 150.10),
        Stock(date: "04/15/2023", openPrice: 151.19, closePrice: 152.99, highPrice: 153.245, lowPrice: 149.92),
        Stock(date: "04/16/2023", openPrice: 152.16, closePrice: 155.85, highPrice: 156.46, lowPrice: 151.64),
        Stock(date: "04/17/2023", openPrice: 156.08, closePrice: 155.00, highPrice: 156.74, lowPrice: 154.28),
        Stock(date: "04/18/2023", openPrice: 150.21, closePrice: 148.50, highPrice: 150.94, lowPrice: 147.6096),
        Stock(date: "04/19/2023", openPrice: 150.21, closePrice: 148.50, highPrice: 150.94, lowPrice: 147.6096),
        Stock(date: "04/20/2023", openPrice: 155.07, closePrice: 157.40, highPrice: 157.82, lowPrice: 154.15),
        Stock(date: "04/21/2023", openPrice: 157.32, closePrice: 159.28, highPrice: 159.40, lowPrice: 156.54),
        Stock(date: "04/22/2023", openPrice: 159.30, closePrice: 157.83, highPrice: 162.14, lowPrice: 157.81),
        Stock(date: "04/23/2023", openPrice: 158.83, closePrice: 158.93, highPrice: 161.5501, lowPrice: 157.68),
        Stock(date: "04/24/2023", openPrice: 158.86, closePrice: 160.25, highPrice: 160.34, lowPrice: 157.85),
        Stock(date: "04/25/2023", openPrice: 158.86, closePrice: 160.25, highPrice: 160.34, lowPrice: 157.85),
        Stock(date: "04/26/2023", openPrice: 158.86, closePrice: 160.25, highPrice: 160.34, lowPrice: 157.85),
        Stock(date: "04/27/2023", openPrice: 159.94, closePrice: 158.28, highPrice: 160.77, lowPrice: 157.87),
        Stock(date: "04/28/2023", openPrice: 157.97, closePrice: 157.65, highPrice: 158.49, lowPrice: 155.98),
        Stock(date: "04/29/2023", openPrice: 159.37, closePrice: 160.77, highPrice: 161.05, lowPrice: 159.35),
        Stock(date: "04/30/2023", openPrice: 161.53, closePrice: 162.36, highPrice: 162.47, lowPrice: 161.271),
        ////            Stock(name: "AAPL", date: "04/31/2023", openPrice: 162.44, closePrice: 164.90, highPrice: 165.00, lowPrice: 161.91),
        //            Stock(name: "AAPL", date: "05/03/2023", openPrice: 164.27, closePrice: 166.17, highPrice: 166.29, lowPrice: 164.22),
    ]

    static let stocksInTenMinutesPeriod: [Stock] = [
        Stock(date: "04/09/2023", openPrice: 153.559, closePrice: 150.59, highPrice: 154.535, lowPrice: 150.225),
        Stock(date: "04/10/2023", openPrice: 150.21, closePrice: 148.50, highPrice: 150.94, lowPrice: 147.6096),
        Stock(date: "04/11/2023", openPrice: 150.21, closePrice: 148.50, highPrice: 150.94, lowPrice: 147.6096),
        Stock(date: "04/12/2023", openPrice: 150.21, closePrice: 148.50, highPrice: 150.94, lowPrice: 147.6096),
        Stock(date: "04/13/2023", openPrice: 147.805, closePrice: 150.47, highPrice: 153.14, lowPrice: 147.70),
        Stock(date: "04/14/2023", openPrice: 151.28, closePrice: 152.59, highPrice: 153.40, lowPrice: 150.10),
        Stock(date: "04/15/2023", openPrice: 151.19, closePrice: 152.99, highPrice: 153.245, lowPrice: 149.92),
        Stock(date: "04/16/2023", openPrice: 152.16, closePrice: 155.85, highPrice: 156.46, lowPrice: 151.64),
        Stock(date: "04/17/2023", openPrice: 156.08, closePrice: 155.00, highPrice: 156.74, lowPrice: 154.28),
        Stock(date: "04/18/2023", openPrice: 150.21, closePrice: 148.50, highPrice: 150.94, lowPrice: 147.6096),
        Stock(date: "04/19/2023", openPrice: 150.21, closePrice: 148.50, highPrice: 150.94, lowPrice: 147.6096),
        Stock(date: "04/20/2023", openPrice: 155.07, closePrice: 157.40, highPrice: 157.82, lowPrice: 154.15),
        Stock(date: "04/21/2023", openPrice: 157.32, closePrice: 159.28, highPrice: 159.40, lowPrice: 156.54),
        Stock(date: "04/22/2023", openPrice: 159.30, closePrice: 157.83, highPrice: 162.14, lowPrice: 157.81),
        Stock(date: "04/23/2023", openPrice: 158.83, closePrice: 158.93, highPrice: 161.5501, lowPrice: 157.68),
        Stock(date: "04/24/2023", openPrice: 158.86, closePrice: 160.25, highPrice: 160.34, lowPrice: 157.85),
        Stock(date: "04/25/2023", openPrice: 158.86, closePrice: 160.25, highPrice: 160.34, lowPrice: 157.85),
        Stock(date: "04/26/2023", openPrice: 158.86, closePrice: 160.25, highPrice: 160.34, lowPrice: 157.85),
        Stock(date: "04/27/2023", openPrice: 159.94, closePrice: 158.28, highPrice: 160.77, lowPrice: 157.87),
        Stock(date: "04/28/2023", openPrice: 157.97, closePrice: 157.65, highPrice: 158.49, lowPrice: 155.98),
        Stock(date: "04/29/2023", openPrice: 159.37, closePrice: 160.77, highPrice: 161.05, lowPrice: 159.35),
        Stock(date: "04/30/2023", openPrice: 161.53, closePrice: 162.36, highPrice: 162.47, lowPrice: 161.271),
    ]

    static var stocksInThirtyMinutesPeriod: [Stock] = [
        Stock(date: "04/23/2023", openPrice: 158.83, closePrice: 158.93, highPrice: 161.5501, lowPrice: 157.68),
        Stock(date: "04/24/2023", openPrice: 158.86, closePrice: 160.25, highPrice: 160.34, lowPrice: 157.85),
        Stock(date: "04/25/2023", openPrice: 158.86, closePrice: 160.25, highPrice: 160.34, lowPrice: 157.85),
        Stock(date: "04/26/2023", openPrice: 158.86, closePrice: 160.25, highPrice: 160.34, lowPrice: 157.85),
        Stock(date: "04/27/2023", openPrice: 159.94, closePrice: 158.28, highPrice: 160.77, lowPrice: 157.87),
        Stock(date: "04/28/2023", openPrice: 157.97, closePrice: 157.65, highPrice: 158.49, lowPrice: 155.98),
        Stock(date: "04/29/2023", openPrice: 159.37, closePrice: 160.77, highPrice: 161.05, lowPrice: 159.35),
        Stock(date: "04/30/2023", openPrice: 161.53, closePrice: 162.36, highPrice: 162.47, lowPrice: 161.271),
        Stock(date: "03/12/2023", openPrice: 150.21, closePrice: 148.50, highPrice: 150.94, lowPrice: 147.6096),
        Stock(date: "03/13/2023", openPrice: 147.805, closePrice: 150.47, highPrice: 153.14, lowPrice: 147.70),
        Stock(date: "03/14/2023", openPrice: 151.28, closePrice: 152.59, highPrice: 153.40, lowPrice: 150.10),
        Stock(date: "03/15/2023", openPrice: 151.19, closePrice: 152.99, highPrice: 153.245, lowPrice: 149.92),
        Stock(date: "03/16/2023", openPrice: 152.16, closePrice: 155.85, highPrice: 156.46, lowPrice: 151.64),
        Stock(date: "03/17/2023", openPrice: 156.08, closePrice: 155.00, highPrice: 156.74, lowPrice: 154.28),
        Stock(date: "03/18/2023", openPrice: 156.08, closePrice: 155.00, highPrice: 156.74, lowPrice: 154.28),
        Stock(date: "03/19/2023", openPrice: 156.08, closePrice: 155.00, highPrice: 156.74, lowPrice: 154.28),
        Stock(date: "03/20/2023", openPrice: 155.07, closePrice: 157.40, highPrice: 157.82, lowPrice: 154.15),
        Stock(date: "03/21/2023", openPrice: 157.32, closePrice: 159.28, highPrice: 159.40, lowPrice: 156.54),
        Stock(date: "03/22/2023", openPrice: 159.30, closePrice: 157.83, highPrice: 162.14, lowPrice: 157.81),
        Stock(date: "03/23/2023", openPrice: 158.83, closePrice: 158.93, highPrice: 161.5501, lowPrice: 157.68),
        Stock(date: "03/24/2023", openPrice: 158.86, closePrice: 160.25, highPrice: 160.34, lowPrice: 157.85),
        Stock(date: "03/25/2023", openPrice: 158.86, closePrice: 160.25, highPrice: 160.34, lowPrice: 157.85),
        Stock(date: "03/26/2023", openPrice: 158.86, closePrice: 160.25, highPrice: 160.34, lowPrice: 157.85),
        Stock(date: "03/27/2023", openPrice: 159.94, closePrice: 158.28, highPrice: 160.77, lowPrice: 157.87),
    ]

    func generateFakeStocks() -> [Stock] {
        let dayes: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        let mounth: [String] = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
        var stocks = [Stock]()
        for i in 2023 ... 2024 {
            for j in 0 ..< 12 {
                if i % 4 == 0, j == 1 {
                    for ij in 1 ..< dayes[j] + 1 {
                        var date: String
                        if ij <= 9 {
                            date = mounth[j] + "/0" + String(ij) + "/" + String(i)
                        } else {
                            date = mounth[j] + "/" + String(ij) + "/" + String(i)
                        }
                        let op = Double.random(in: 150.0 ..< 160.0)
                        let cp = Double.random(in: 150.0 ..< 160.0)
                        let minp = Double.random(in: 145.0 ..< min(op, cp))
                        let maxp = Double.random(in: max(op, cp) ..< 165)

                        stocks.append(Stock(date: date, openPrice: op, closePrice: cp, highPrice: maxp, lowPrice: minp))
                    }

                } else {
                    for ij in 1 ..< dayes[j] {
                        var date: String
                        if ij <= 9 {
                            date = mounth[j] + "/0" + String(ij) + "/" + String(i)
                        } else {
                            date = mounth[j] + "/" + String(ij) + "/" + String(i)
                        }
                        let op = Double.random(in: 150.0 ..< 160.0)
                        let cp = Double.random(in: 150.0 ..< 160.0)
                        let minp = Double.random(in: 145.0 ..< min(op, cp))
                        let maxp = Double.random(in: max(op, cp) ..< 170)
                        stocks.append(Stock(date: date, openPrice: op, closePrice: cp, highPrice: maxp, lowPrice: minp))
                    }
                }
            }
        }
        return stocks
    }

    static func makeListScreenViewModel() -> ListScreenViewModel {
        ListScreenViewModel(useCase: ListScreenUseCaseFake())
    }
}

extension Fakes {
    private class ListScreenUseCaseFake: ListScreenUseCase {
        func getTickers() async throws -> [Ticker] {
            tickers
        }
    }
}
