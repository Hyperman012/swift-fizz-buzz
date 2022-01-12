import XCTest
@testable import storyboard

class WeatherServiceTests: XCTestCase {
    var weatherService: WeatherService!

    override func setUpWithError() throws {
        weatherService = WeatherService()
    }

    override func tearDownWithError() throws {
    
    }
    
    func testGetSeattleWeatherReport() async throws {
        //arrange
        let expectedName = "Seattle"
        
        //act
        let actualReport = await weatherService.getWeatherReport()
        
        //assert
        assertIsValidReportForCity(actualReport: actualReport, city: expectedName)
    }

    func testGetBuffaloWeatherReport() async throws {
        //arrange
        let expectedName = "Buffalo"

        //act
        let actualReport = await weatherService.getWeatherReport(expectedName)

        //assert
        assertIsValidReportForCity(actualReport: actualReport, city: expectedName)
    }

    func testGetWeatherReportWithStub() async throws {
        // arrange.
        let name = "Example"
        let currentCondition = "condition"
        let expectedReport = WeatherReport(name: name, currentCondition: currentCondition)

        let weatherService = WeatherService(StubHTTPClient(name: name, currentCondition: currentCondition))

        // act.
        let actualReport = await weatherService.getWeatherReport()

        // assert.
        XCTAssertEqual(actualReport, expectedReport)
    }

    private func assertIsValidReportForCity(actualReport: WeatherReport, city: String) {
        XCTAssertEqual(actualReport.name, city)
        XCTAssertNotNil(actualReport.currentCondition)
    }
}

class StubHTTPClient: HttpClient {
    let rawJson = "{\"weather\":[{\"id\":501,\"main\":\"condition\",\"description\":\"moderate rain\",\"icon\":\"10d\"}],\"base\":\"stations\",\"main\":{\"temp\":277.33,\"feels_like\":275.32,\"temp_min\":273.67,\"temp_max\":280.64,\"pressure\":1027,\"humidity\":85},\"visibility\":10000,\"wind\":{\"speed\":2.24,\"deg\":232,\"gust\":5.36},\"rain\":{\"1h\":1.89},\"clouds\":{\"all\":100},\"dt\":1641830283,\"sys\":{\"type\":2,\"id\":2004026,\"country\":\"US\",\"sunrise\":1641830124,\"sunset\":1641861481},\"timezone\":-28800,\"id\":5809844,\"name\":\"Example\",\"cod\":200}"
    let shortJson: String

    init(name: String, currentCondition: String) {
        shortJson = "{\"weather\":[{\"main\":\"\(currentCondition)\"}],\"name\":\"\(name)\"}"
    }

    public override func getDataFromUrl(from: URL) async -> Data {
        shortJson.data(using: .utf8)!
    }
}
