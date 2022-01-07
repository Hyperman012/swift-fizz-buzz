import XCTest
@testable import storyboard

class WeatherServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let weatherService = WeatherService()
        
        let currentWeather = weatherService.getCurrentWeather("Seattle")
        
        XCTAssertNotNil(currentWeather)
    }
    
    b1605dacb10c42feab34a04fd0531567
    
    api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

}
