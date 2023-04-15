import Foundation

enum PatternRecognition {
    //    init() {
    //        print(ext_near(x: 1000.0, y: 1005.0))
    //        print(lar_less(x: 1000.0, y: 1030.0))
    //        print(lar_greater(x: 1030.0, y: 1000.0))
    //        print(sli_less(x: 1000.0, y: 1004.0))
    //        print(sli_greater(x: 1004.0, y: 1000.0))
    //    }

    static func ext_near(x: Double, y: Double) -> Bool {
        abs(x - y) / max(x, y) <= 0.003
    }

    static func lar_less(x: Double, y: Double) -> Bool {
        let z = (y - x) / x
        return (z >= 0.025) && (z < 0.05)
    }

    static func lar_greater(x: Double, y: Double) -> Bool {
        let z = (x - y) / x
        return (z >= 0.025) && (z < 0.05)
    }

    static func sli_less(x: Double, y: Double) -> Bool {
        let z = (y - x) / x
        return (z >= 0.003) && (z < 0.01)
    }

    static func sli_greater(x: Double, y: Double) -> Bool {
        let z = (x - y) / x
        return (z >= 0.003) && (z < 0.01)
    }
}
