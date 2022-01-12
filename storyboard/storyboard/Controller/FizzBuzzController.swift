import UIKit

class FizzBuzzController {
    public func buildViewModel(input: String?) -> FizzBuzzViewModel {
        let fizzyBuzzy = FizzyBuzzy(ThreeStrategy(), FiveStrategy())

        guard let inputAsNumber = Int(input!) else {
            return FizzBuzzViewModel(text: "Error invalid input", background: UIColor.red)
        }

        return FizzBuzzViewModel(text: fizzyBuzzy.calculate(inputAsNumber), background: nil)
    }
}
