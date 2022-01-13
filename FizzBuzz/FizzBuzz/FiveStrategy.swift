import Foundation

public final class FiveStrategy: StrategyProtocol {
    public init() {}
    
    public func evaluate(_ input: Int) -> Bool {
        input % 5 == 0
    }
}
