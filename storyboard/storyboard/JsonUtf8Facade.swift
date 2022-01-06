import Foundation

public class JsonUtf8Facade {
    public func decodeToType<T>(_ json: String, _ type: T.Type) -> T? where T: Decodable {
        return try? JSONDecoder().decode(type, from: json.data(using: .utf8)!)
    }
    
    public func encodeToJsonString<T>(_ object: T) throws -> String where T: Encodable {
        let encodedJson = try JSONEncoder().encode(object)
        
        return String(data: encodedJson, encoding: .utf8)!
    }
}
