import Foundation

open class ThreeStrategy: StrategyProtocol {
    public init() {}
    
    open func evaluate(_ input: Int) -> Bool {
        input % 3 == 0
    }
}
