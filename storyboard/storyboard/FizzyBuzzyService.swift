import Foundation

class FizzyBuzzyService {
    let fizzBuzz = FizzyBuzzy()
    
    public func calculateAsJson(_ input: String) -> String {
        let inputObject = parseInput(input)
        
        let result = FizzBuzzReturn(result: fizzBuzz.calculate(inputObject!.input))
        return encodeReturn(result)
    }
    
    private func parseInput(_ input: String) -> FizzBuzzInput? {
        return try? JSONDecoder().decode(FizzBuzzInput.self, from: input.data(using: .utf8)!)
    }
    
    private func encodeReturn(_ result: FizzBuzzReturn) -> String {
        let returnString = try? JSONEncoder().encode(result)
        
        return String(data: returnString!, encoding: .utf8)!
    }
}

public struct FizzBuzzReturn: Codable, Equatable {
    let result: String
}
public struct FizzBuzzInput: Codable, Equatable {
    let input: Int
}
