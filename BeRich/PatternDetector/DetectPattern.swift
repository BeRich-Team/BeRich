import Foundation

func detectPattern(candelsticks: [Candlestick],
                   pattern: CandlePattern) -> Set<DetectedPattern>
{
    let patternLenght = pattern.patternLenght
    let patternSignificantLength = pattern.patternSignificantLength
    var timeserieses: [Timeseries] = []
    for ind in patternLenght ... candelsticks.count {
        timeserieses.append(Timeseries(len: patternLenght,
                                       candlesticks: Array(candelsticks[ind - patternLenght ..< ind])))
    }

    var detectedPatterns: Set<DetectedPattern> = Set()
    for ind in 0 ..< timeserieses.count {
        if pattern.logicalCondition(timeserieses[ind]) {
            detectedPatterns.insert(DetectedPattern(pattern: pattern,
                                                    startIndex: ind - patternSignificantLength,
                                                    endIndex: ind))
        }
    }

    return detectedPatterns
}
