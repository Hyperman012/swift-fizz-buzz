import Foundation

public class WeatherService {
    let httpClient: HttpClient

    public convenience init() {
        self.init(HttpClient())
    }

    init(_ httpClient: HttpClient) {
        self.httpClient = httpClient
    }

    func getWeatherReport(_ city: String = "Seattle") async -> WeatherReport {
        let url = createUrlFor(city)
        let weatherResponse = await getWeatherResponse(from: url)

        return WeatherReport(name: weatherResponse.name, currentCondition: weatherResponse.weather.first!.main)
    }

    private func getWeatherResponse(from url: URL) async -> WeatherResponse {
        let data = await httpClient.getDataFromUrl(from: url)

        return JsonUtf8Facade().decodeToType(data, WeatherResponse.self)!
    }

    private func createUrlFor(_ city: String) -> URL {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=b1605dacb10c42feab34a04fd0531567"

        return URL(string: urlString)!
    }
}

public struct WeatherResponse: Codable {
    let name: String
    let weather: [WeatherCondition]
}

public struct WeatherCondition: Codable {
    let main: String
}

