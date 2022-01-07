import Foundation

public class JsonUtf8Facade {
    public func decodeToType<T>(_ json: String, _ type: T.Type) -> T? where T: Decodable {
        self.decodeToType(json.data(using: .utf8)!, type)
    }
    
    public func decodeToType<T>(_ jsonData: Data, _ type: T.Type) -> T? where T: Decodable {
        try? JSONDecoder().decode(type, from: jsonData)
    }
    
    public func encodeToJsonString<T>(_ object: T) throws -> String where T: Encodable {
        String(data: try JSONEncoder().encode(object), encoding: .utf8)!
    }
}
