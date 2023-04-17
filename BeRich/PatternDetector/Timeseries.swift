import Foundation

struct Timeseries {
    let len: Int
    let candlesticks: [Candlestick]

    init(len: Int,
         candlesticks: [Candlestick])
    {
        self.len = len
        guard candlesticks.count == len else {
            self.candlesticks = []
            print("timeseries len is wrong")
            return
        }
        self.candlesticks = candlesticks
    }
}
