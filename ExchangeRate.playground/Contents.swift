import Foundation


struct ExchageRate {

    var currencyRate: Double {
        willSet {
            print("currencyRate willSet - 환율 변동 예정: \(currencyRate) -> \(newValue)")
        }
        didSet {
            print("currencyRate willSet - 환율 변동 완료: \(oldValue) -> \(currencyRate)")
        }
    }

    var USD: Double {
        willSet {
            print("USD willSet - 환전 금액: USD: \(USD)달러로 환전될 예정 ")
        }
        didSet {
            print("USD willSet - KRW: \(Int(round(KRW)))원 -> \(USD)달러로 환전되었음. ")
        }
    }

    var KRW: Double {
        get {
            return currencyRate * USD
        }
        set {
            let change = String(format: "%.2f", newValue / currencyRate)
            USD = Double(change)!
        }
    }
}

var rate = ExchageRate(currencyRate: 1100, USD: 1)

rate.KRW = 500000
rate.currencyRate = 1350
rate.KRW = 500000

