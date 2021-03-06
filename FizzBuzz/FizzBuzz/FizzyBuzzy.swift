import Foundation

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
    
    public func calculate(_ inputs: [Int]) -> [String] {
        inputs.map(calculate(_:))
    }
    
    public func calculate(_ inputs: Set<Int>) -> Set<String> {
        Set(inputs.map(calculate(_:)))
    }

    public func calculate(_ inputs: inout [Int:String?]) {
        inputs.forEach { (key, _) in inputs[key] = calculate(key) }
    }
}
