import XCTest
@testable import storyboard

class WeatherServiceTests: XCTestCase {
    var weatherService: WeatherService!

    override func setUpWithError() throws {
        weatherService = WeatherService()
    }

    override func tearDownWithError() throws {
    
    }

    func testSeattleShouldReturnRain() async throws {
        let currentWeather = await weatherService.getCurrentWeather("Seattle")
        
        XCTAssertEqual("rain", currentWeather)
        
    }
    
    func testBuffaloShouldReturnSnow() async throws {
        let currentWeather = await weatherService.getCurrentWeather("Buffalo")
        
        XCTAssertEqual("snow", currentWeather)
    }
    
    func testBlankcityReturnEmptyString() async throws {
        let currentWeather = await weatherService.getCurrentWeather("")
        
        XCTAssertEqual("", currentWeather)
    }
    
    func testGetSeattleWeatherReport() async throws {
        //arrange
        let expectedName = "Seattle"
        
        //act
        let actualReport = await weatherService.getWeatherReport()
        
        //assert
        XCTAssertEqual(actualReport.name, expectedName)
        XCTAssertNotNil(actualReport.currentCondition)
    }
    
    func testGetBuffaloWeatherReport() async throws {
        //arrange
        let expectedName = "Buffalo"
        
        //act
        let actualReport = await weatherService.getWeatherReport(expectedName)
        
        //assert
        XCTAssertEqual(actualReport.name, expectedName)
        XCTAssertNotNil(actualReport.currentCondition)
    }
    
}
