import Foundation


//struct ExchageRate {
//
//    var currencyRate: Double {
//        willSet {
//            print("currencyRate willSet - 환율 변동 예정: \(currencyRate) -> \(newValue)")
//        }
//        didSet {
//            print("currencyRate willSet - 환율 변동 완료: \(oldValue) -> \(currencyRate)")
//        }
//    }
//
//    var USD: Double {
//        willSet {
//            print("USD willSet - 환전 금액: USD: \(USD)달러로 환전될 예정 ")
//        }
//        didSet {
//            print("USD willSet - KRW: \(Int(round(KRW)))원 -> \(USD)달러로 환전되었음. ")
//        }
//    }
//
//    var KRW: Double {
//        get {
//            return currencyRate * USD
//        }
//        set {
//            let change = String(format: "%.2f", newValue / currencyRate)
//            USD = Double(change)!
//        }
//    }
//}
//
//var rate = ExchageRate(currencyRate: 1100, USD: 1)
//
//rate.KRW = 500000
//rate.currencyRate = 1350
//rate.KRW = 500000



//protocol work {
//    var shot: Int { get }
//
//    func makeAmericano() -> String
//}


//class A: work {
//    var shot: Int
//
//    func makeAmericano() -> String {
//        <#code#>
//    }
//
//
//}
//
//struct B: work {
//    var shot: Int
//
//    func makeAmericano() -> String {
//        <#code#>
//    }
//
//}
//
//enum C: work {
//    var shot: Int
//
//    func makeAmericano() -> String {
//        <#code#>
//    }
//
//}


//class A {
//    var value1: String = ""
//}
//
//class AA: A {
//    var value2 = 1
//}
//
//class AAA: AA {
//    var value3 = 3
//}
//
//
//let a: A = AAA()
//let aaa = AAA()
//
//
//a.value1
//
//
//
//
//
//class Human {
//   let name: String = "Sodeul"
//}
//class Teacher: Human {
//   let subject: String = "English"
//}
//class Student: Human {
//   let grade: Int = 1
//}
//
//
//let human1 = Teacher.init() as Human
//let human2: Human = Teacher()
//
//
//human1.name
//human2.name




// @@@@@@@@@@@@@ Capture 관련 정리 @@@@@@@@@@@@@

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    deinit { print("\(self.name) 메모리에서 해제 ") }
}


func delay(_ seconds: Int, closure: @escaping () -> ()) {
    let time = DispatchTime.now() + .seconds(seconds)
    DispatchQueue.main.asyncAfter(deadline: time) {
        print("타이머 끝")
        closure()
    }
}


class captureExample2 {
    
    var person = Person(name: "1")
    
    
    deinit {
        print("해제 성공!!")
    }
    
    
    func capturingValueTest03() {
        
        print("최초 closure \(person.name)")
        
        delay(1) { [person] in
            print("캡쳐 O 내부 closure \(person.name)")
        }

        delay(1) { [self] in                            // [self] or [weak self]
            print("캡쳐 X 내부 closure \(person.name)")
        }
        
        person = Person(name: "2")
        print("변경이후 closure \(person.name)")
    }
}

var example: captureExample2? = captureExample2()

//example!.capturingValueTest03()
//example = nil



/* [self] 시
 
 최초 closure 1
 변경이후 closure 2
 타이머 끝
 캡쳐 O 내부 closure 1
 1 메모리에서 해제
 타이머 끝
 캡쳐 X 내부 closure 2
 해제 성공!!
 2 메모리에서 해제
 */



/* [weak self] 시

 최초 closure 1
 변경이후 closure 2
 해제 성공!!
 2 메모리에서 해제
 타이머 끝
 캡쳐 O 내부 closure 1
 1 메모리에서 해제
 타이머 끝
 캡쳐 X 내부 closure nil
 */

