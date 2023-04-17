import Foundation

enum CandlePattern {
    case marubozuBlack
    case marubozuWhite
    case hammer
    case piercingPattern
    case twoCrowns
    case concealingBabySwallow
    case ladderBottom
    case takuriLine
    case kickingBullish
}

extension CandlePattern {
    var patternLenght: Int {
        switch self {
        case .marubozuBlack:
            return 1
        case .marubozuWhite:
            return 1
        case .hammer:
            // 9 свечей - 8 тренд + 1 значимая
            return 9
        case .piercingPattern:
            // 10 свечей - 8 тренд + 2 значимых
            return 10
        case .twoCrowns:
            // 11 свечей - 8 тренд + 3 значимых
            return 11
        case .concealingBabySwallow:
            // 12 свечей - 8 тренд + 4 значимых
            return 12
        case .ladderBottom:
            // 13 свечей - 8 тренд + 5 значимых
            return 13
        case .takuriLine:
            // 6 candles = 5 trend + 1 significant
            return 6
        case .kickingBullish:
            // 2 candles = 2 significant, trend is not important
            return 2
        }
    }

    var patternSignificantLength: Int {
        switch self {
        case .marubozuBlack:
            return 1
        case .marubozuWhite:
            return 1
        case .hammer:
            // 9 свечей - 8 тренд + 1 значимая
            return 1
        case .piercingPattern:
            // 10 свечей - 8 тренд + 2 значимых
            return 2
        case .twoCrowns:
            // 11 свечей - 8 тренд + 3 значимых
            return 3
        case .concealingBabySwallow:
            // 12 свечей - 8 тренд + 4 значимых
            return 4
        case .ladderBottom:
            // 13 свечей - 8 тренд + 5 значимых
            return 5
        case .takuriLine:
            // 6 candles = 5 trend + 1 significant
            return 1
        case .kickingBullish:
            // 2 candles = 2 significant, trend is not important
            return 2
        }
    }

    var logicalCondition: (Timeseries) -> Bool {
        switch self {
        case .marubozuBlack:
            return { t in
                t.len == 1 &&
                    t.candlesticks[0].no_us &&
                    t.candlesticks[0].long_black_body &&
                    t.candlesticks[0].no_ls
            }
        case .marubozuWhite:
            return { t in
                t.len == 1 &&
                    t.candlesticks[0].no_us &&
                    t.candlesticks[0].long_white_body &&
                    t.candlesticks[0].no_ls
            }
        case .hammer:
            return { t in
                CandlePattern.pt(t) == -1 &&
                    t.candlesticks[8].small_body &&
                    (!t.candlesticks[8].no_ls) &&
                    (2 * t.candlesticks[8].hb < t.candlesticks[8].ls &&
                        t.candlesticks[8].ls < 3 * t.candlesticks[8].hb) &&
                    (t.candlesticks[8].small_us || t.candlesticks[8].no_us)
            }
        case .piercingPattern:
            return { t in
                CandlePattern.pt(t) == -1 &&
                    t.candlesticks[8].black_body &&
                    t.candlesticks[9].white_body &&
                    (t.candlesticks[9].openPrice < t.candlesticks[8].lowPrice) &&
                    ((0.5 * (t.candlesticks[8].closePrice + t.candlesticks[8].openPrice) < t.candlesticks[9].closePrice) &&
                        (t.candlesticks[9].closePrice < t.candlesticks[8].openPrice))
            }
        case .twoCrowns:
            return { t in
                CandlePattern.pt(t) == 1 &&
                    t.candlesticks[8].long_white_body &&
                    t.candlesticks[9].black_body &&
                    up_body_gap(t.candlesticks[8], t.candlesticks[9]) &&
                    t.candlesticks[10].black_body &&
                    ((t.candlesticks[9].closePrice < t.candlesticks[10].openPrice && t.candlesticks[10].openPrice < t.candlesticks[9].openPrice) ||
                        (t.candlesticks[8].openPrice < t.candlesticks[10].closePrice && t.candlesticks[10].closePrice < t.candlesticks[8].closePrice))
            }
        case .concealingBabySwallow:
            return { t in
                CandlePattern.pt(t) == -1 &&
                    t.candlesticks[8].no_us &&
                    t.candlesticks[8].long_black_body &&
                    t.candlesticks[8].no_ls &&
                    t.candlesticks[9].no_us &&
                    t.candlesticks[9].long_black_body &&
                    t.candlesticks[9].no_ls &&
                    t.candlesticks[10].black_body &&
                    t.candlesticks[10].long_us &&
                    down_body_gap(t.candlesticks[8], t.candlesticks[10]) &&
                    down_body_gap(t.candlesticks[9], t.candlesticks[10]) &&
                    (t.candlesticks[9].openPrice > t.candlesticks[10].highPrice &&
                        t.candlesticks[10].highPrice > t.candlesticks[9].closePrice) &&
                    t.candlesticks[11].black_body &&
                    t.candlesticks[11].highPrice > t.candlesticks[10].highPrice &&
                    t.candlesticks[10].lowPrice > t.candlesticks[11].lowPrice
            }
        case .ladderBottom:
            return { t in
                CandlePattern.pt(t) == -1 &&
                    t.candlesticks[8].long_black_body &&
                    t.candlesticks[9].long_black_body &&
                    t.candlesticks[10].long_black_body &&
                    t.candlesticks[9].openPrice < t.candlesticks[8].openPrice &&
                    t.candlesticks[10].openPrice < t.candlesticks[9].openPrice &&
                    t.candlesticks[9].closePrice < t.candlesticks[8].closePrice &&
                    t.candlesticks[10].closePrice < t.candlesticks[9].closePrice &&
                    t.candlesticks[11].black_body &&
                    !t.candlesticks[11].no_us &&
                    t.candlesticks[12].white_body &&
                    up_body_gap(t.candlesticks[11], t.candlesticks[12])
            }
        case .takuriLine:
            return { t in
                CandlePattern.pt(t) == -1 &&
                    t.candlesticks[5].small_body &&
                    t.candlesticks[5].no_us &&
                    (t.candlesticks[5].ls > 3 * t.candlesticks[5].hb)
            }
        case .kickingBullish:
            return { t in
                t.candlesticks[0].long_black_body &&
                    t.candlesticks[0].no_us &&
                    t.candlesticks[0].no_ls &&
                    up_body_gap(t.candlesticks[0], t.candlesticks[1]) &&
                    t.candlesticks[1].long_white_body &&
                    t.candlesticks[1].no_us &&
                    t.candlesticks[1].no_ls
            }
        }
    }
}

extension CandlePattern {
    private static func ap(_ t: Timeseries, _ k: Int) -> Double {
        // средняя close по 5 свечам, начиная с k
        if t.len < k + 5 { return 0 }
        var s = 0.0
        for i in k ..< k + 5 {
            s += t.candlesticks[i].closePrice
        }
        return s / 5
    }

    private static func pt(_ t: Timeseries) -> Int {
        // тренд по 1-м 8 свечам
        if t.len < 8 { return 0 }
        if ap(t, 0) < ap(t, 1),
           ap(t, 1) < ap(t, 2),
           ap(t, 2) < ap(t, 3)
        {
            return 1
        }
        if ap(t, 0) > ap(t, 1),
           ap(t, 1) > ap(t, 2),
           ap(t, 2) > ap(t, 3)
        {
            return -1
        }
        return 0
    }
}

private func up_body_gap(_ c1: Candlestick, _ c2: Candlestick) -> Bool {
    c1.tp_body < c2.bm_body
}

private func down_body_gap(_ c1: Candlestick, _ c2: Candlestick) -> Bool {
    c1.bm_body > c2.tp_body
}
