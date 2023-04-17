import Foundation

struct Candlestick {
    let openPrice: Double
    let highPrice: Double
    let lowPrice: Double
    let closePrice: Double

    let hb: Double
    let tp_body: Double
    let bm_body: Double
    let us: Double
    let ls: Double
    let hs: Double
    let black_body: Bool
    let white_body: Bool
    let long_body: Bool
    let small_body: Bool
    let small_us: Bool
    let long_us: Bool
    let long_black_body: Bool
    let long_white_body: Bool
    let no_ls: Bool
    let no_us: Bool

    init(openPrice: Double,
         highPrice: Double,
         lowPrice: Double,
         closePrice: Double)
    {
        self.openPrice = openPrice
        self.highPrice = highPrice
        self.lowPrice = lowPrice
        self.closePrice = closePrice
        hb = abs(closePrice - openPrice)
        tp_body = max(openPrice, closePrice)
        bm_body = min(openPrice, closePrice)
        us = highPrice - tp_body
        ls = bm_body - lowPrice
        hs = us + ls
        black_body = openPrice > closePrice
        white_body = openPrice < closePrice
        long_body = lar_less(x: bm_body, y: tp_body)
        small_body = sli_less(x: bm_body, y: tp_body)
        small_us = sli_greater(x: highPrice, y: tp_body)
        long_us = lar_greater(x: highPrice, y: tp_body)
        long_black_body = long_body && black_body
        long_white_body = long_body && white_body
        no_ls = ext_near(x: lowPrice, y: bm_body)
        no_us = ext_near(x: highPrice, y: tp_body)
    }
}

private func ext_near(x: Double, y: Double) -> Bool {
    abs(x - y) / max(x, y) <= 0.003
}

private func lar_less(x: Double, y: Double) -> Bool {
    let z = (y - x) / x
    return (z >= 0.025) && (z < 0.05)
}

private func lar_greater(x: Double, y: Double) -> Bool {
    let z = (x - y) / x
    return (z >= 0.025) && (z < 0.05)
}

private func sli_less(x: Double, y: Double) -> Bool {
    let z = (y - x) / x
    return (z >= 0.003) && (z < 0.01)
}

private func sli_greater(x: Double, y: Double) -> Bool {
    let z = (x - y) / x
    return (z >= 0.003) && (z < 0.01)
}
