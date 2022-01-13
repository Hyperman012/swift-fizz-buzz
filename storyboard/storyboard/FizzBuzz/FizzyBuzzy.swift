import Foundation
import FizzBuzz

public class FizzyBuzzy {
    var threeStrategy: StrategyProtocol
    var fiveStrategy: StrategyProtocol

    public convenience init() {
        self.init(ThreeStrategy(), FiveStrategy())
    }
    
    public required init(_ threeStrategy: StrategyProtocol, _ fiveStrategy: StrategyProtocol) {
        self.threeStrategy = threeStrategy
        self.fiveStrategy = fiveStrategy
    }

    public func calculate(_ input: Int) -> String {
        if (threeStrategy.evaluate(input) && fiveStrategy.evaluate(input)) {
            return "fizzbuzz"
        }

        if (fiveStrategy.evaluate(input)) {
            return "buzz"
        }

        if (threeStrategy.evaluate(input)) {
            return "fizz"
        }

        return String(input)
    }

}
