import Foundation

public class WeatherController {
    private let viewModel: WeatherViewModel

    public init(_ viewModel: WeatherViewModel) {
        self.viewModel = viewModel
    }

    public func buildViewModel(_ weatherService: WeatherService) async {
        let currentCondition = await weatherService.getWeatherReport().currentCondition
        viewModel.currentCondition = currentCondition
    }
}
