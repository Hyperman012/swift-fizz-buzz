import Foundation

class HttpClient {
    let session: URLSession = URLSession.shared
    public func getDataFromUrl(from: URL) async -> Data {
        let (data, _) = try! await session.data(from: from)
        return data
    }
}
