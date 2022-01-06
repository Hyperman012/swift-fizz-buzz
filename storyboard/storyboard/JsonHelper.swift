import Foundation

public class JsonHelper {
    public func decode<T>(_ input: String, _ type: T.Type) -> T where T: Decodable {
        return try! JSONDecoder().decode(type, from: input.data(using: .utf8)!)
    }
}



