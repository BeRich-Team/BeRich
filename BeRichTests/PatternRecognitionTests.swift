import XCTest

@testable import BeRich

final class PatternRecognitionTests: XCTestCase {
//    private let path = Bundle.main.path(forResource: "sber", ofType: "csv")!

    private func getCSVData(path _: String? = nil) -> [Candlestick] {
        let path = Bundle(for: type(of: self)).path(forResource: "sber", ofType: "csv")!

        let content = try! String(contentsOfFile: path)
        let parsedCSV: [[String]] = content
            .components(
                separatedBy: "\n"
            )
            .map {
                $0.components(separatedBy: ",")
            }

        let candles = parsedCSV
            .compactMap {
                let openPrice = Double($0[4])!
                let highPrice = Double($0[5])!
                let lowPrice = Double($0[6])!
                let closePrice = Double($0[7])!
                return Candlestick(openPrice: openPrice,
                                   highPrice: highPrice,
                                   lowPrice: lowPrice,
                                   closePrice: closePrice)
            }
        return candles
    }

    func testDetectMarubozuBlackPattern() throws {
        let candlesticks = getCSVData()
        let detectedPatterns = detectPattern(candelsticks: candlesticks,
                                             pattern: CandlePattern.marubozuBlack)

        XCTAssertEqual(detectedPatterns.count, 9)
    }

    func testDetectMarubozuWhitePattern() throws {
        let candlesticks = getCSVData()
        let detectedPatterns = detectPattern(candelsticks: candlesticks,
                                             pattern: CandlePattern.marubozuWhite)

        XCTAssertEqual(detectedPatterns.count, 3)
    }

    func testHammerPattern() throws {
        let candlesticks = getCSVData()
        let detectedPatterns = detectPattern(candelsticks: candlesticks,
                                             pattern: CandlePattern.hammer)
        XCTAssertEqual(detectedPatterns.count, 18)
    }

    func testPiercingPattern() throws {
        let candlesticks = getCSVData()
        let detectedPatterns = detectPattern(candelsticks: candlesticks,
                                             pattern: CandlePattern.piercingPattern)
        XCTAssertEqual(detectedPatterns.count, 3)
    }

    func testTwoCrownsPattern() throws {
        let candlesticks = getCSVData()
        let detectedPatterns = detectPattern(candelsticks: candlesticks,
                                             pattern: CandlePattern.twoCrowns)
        XCTAssertEqual(detectedPatterns.count, 0)
    }

    func testConcealingBabySwallowPattern() throws {
        let candlesticks = getCSVData()
        let detectedPatterns = detectPattern(candelsticks: candlesticks,
                                             pattern: CandlePattern.concealingBabySwallow)
        XCTAssertEqual(detectedPatterns.count, 0)
    }

    func testLadderBottomPattern() throws {
        let candlesticks = getCSVData()
        let detectedPatterns = detectPattern(candelsticks: candlesticks,
                                             pattern: CandlePattern.ladderBottom)
        XCTAssertEqual(detectedPatterns.count, 0)
    }

    func testKickingBullishPattern() throws {
        let candlesticks = getCSVData()
        let detectedPatterns = detectPattern(candelsticks: candlesticks,
                                             pattern: CandlePattern.kickingBullish)
        XCTAssertEqual(detectedPatterns.count, 0)
    }
}
