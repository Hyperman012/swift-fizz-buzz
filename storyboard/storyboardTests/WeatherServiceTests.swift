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

}
