import Foundation

public class WeatherViewModel: ObservableObject {
    @Published public var currentCondition: String?

    public init(currentCondition: String) {
        self.currentCondition = currentCondition
    }
}
