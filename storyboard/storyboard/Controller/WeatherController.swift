import Foundation

public class WeatherController {
    public func buildViewModel(_ weatherService: WeatherService) async -> WeatherViewModel {
        let currentCondition = await weatherService.getWeatherReport().currentCondition
        return WeatherViewModel(currentCondition: currentCondition)
    }
}
