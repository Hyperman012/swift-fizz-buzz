import Foundation

class WeatherService {
    let apiKey = "b1605dacb10c42feab34a04fd0531567"
    //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    
    func getCurrentWeather(_ city: String) async -> String {
        if city.isEmpty { return "" }
        
        let _ = await getWeatherReport()
        if (city == "Seattle") {
            return "rain"
        }
        
        return "snow"
    }
    
    func getWeatherReport(_ city: String = "Seattle") async -> WeatherReport {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=b1605dacb10c42feab34a04fd0531567"
        
        let url = URL(string: urlString)!
        
        let (data, _) = try! await URLSession.shared.data(from: url)

        let weatherResponse = JsonUtf8Facade().decodeToType(data, WeatherResponse.self)!
        
        //print(weatherResponse)
        //Optional(storyboard.WeatherResponse(name: "Seattle"))
        //print(String(data: data, encoding: .utf8))
        //Optional("{\"coord\":{\"lon\":-122.3321,\"lat\":47.6062},\"weather\":[{\"id\":701,\"main\":\"Mist\",\"description\":\"mist\",\"icon\":\"50d\"},{\"id\":500,\"main\":\"Rain\",\"description\":\"light rain\",\"icon\":\"10d\"}],\"base\":\"stations\",\"main\":{\"temp\":280.01,\"feels_like\":280.01,\"temp_min\":278.35,\"temp_max\":281.04,\"pressure\":998,\"humidity\":90},\"visibility\":3219,\"wind\":{\"speed\":0.89,\"deg\":309,\"gust\":2.24},\"rain\":{\"1h\":0.13},\"clouds\":{\"all\":100},\"dt\":1641582530,\"sys\":{\"type\":2,\"id\":2004026,\"country\":\"US\",\"sunrise\":1641570991,\"sunset\":1641602065},\"timezone\":-28800,\"id\":5809844,\"name\":\"Seattle\",\"cod\":200}")
        
        return WeatherReport(name: weatherResponse.name, currentCondition: weatherResponse.weather[0].main)
    }
}

public struct WeatherReport {
    let name: String
    let currentCondition: String
}

public struct WeatherResponse: Codable {
    let name: String
    let weather: [WeatherCondition]
}

public struct WeatherCondition: Codable {
    let main: String
}
