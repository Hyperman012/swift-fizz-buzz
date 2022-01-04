import Foundation

public class ThreeStrategy: StrategyProtocol {
    public func evaluate(_ input: Int) -> Bool {
        input % 3 == 0
    }
}
