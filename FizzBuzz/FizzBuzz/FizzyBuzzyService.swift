import Foundation

public class FizzyBuzzyService {
    let fizzBuzz = FizzyBuzzy()
    
    public init() {}
    
    public func calculateAsJson(_ input: String) -> String {
        let jsonUtf8Facade = JsonUtf8Facade()
        let inputObject = jsonUtf8Facade.decodeToType(input, FizzBuzzInput.self)
        
        let result = FizzBuzzReturn(result: fizzBuzz.calculate(inputObject!.input))
        return try! jsonUtf8Facade.encodeToJsonString(result)
    }
}

public struct FizzBuzzReturn: Codable, Equatable {
    let result: String
}
public struct FizzBuzzInput: Codable, Equatable {
    let input: Int
}
