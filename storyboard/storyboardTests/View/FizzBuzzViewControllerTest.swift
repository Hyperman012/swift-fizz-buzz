import XCTest
@testable import storyboard

class FizzBuzzViewControllerTest: XCTestCase {
    var viewController: FizzBuzzViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(identifier: String(describing: FizzBuzzViewController.self))
        viewController.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        viewController = nil
        try super.tearDownWithError()
    }

    func testThatLabelIsBoundToMainLabel() throws {
        XCTAssertEqual(viewController.label.accessibilityIdentifier, "main_label")
    }

    func testShouldShowButton() throws {
        XCTAssertEqual(viewController.button.accessibilityIdentifier, "button")
    }

    func testShouldHaveInputBox() throws {
        XCTAssertEqual(viewController.input.accessibilityIdentifier, "input")
    }

    func testShouldBindCurrentCondition() throws {
        XCTAssertEqual(viewController.currentWeather.accessibilityIdentifier, "currentWeather")
    }
    func testShouldBindCurrentCity() throws {
        XCTAssertEqual(viewController.currentCity.accessibilityIdentifier, "currentCity")
    }

    @MainActor func testShouldUpdateWeatherOnViewDidLoad() async throws {
        // arrange.
        let expectedWeather = "expectedWeather"
        let weatherService = WeatherService(StubHTTPClient(name: "", currentCondition: expectedWeather))

        // act.
        let viewController = getViewController(weatherService)
        await viewController.getAndSetCurrentWeather()

        // assert.
        XCTAssertEqual(viewController.currentWeather.text, expectedWeather)
    }

    @MainActor func testShouldUseWeatherService() async throws {
        // arrange.
        let expectedWeather = "Im in Use"
        let weatherService = WeatherService(StubHTTPClient(name: "", currentCondition: expectedWeather))

        // act.
        let viewController = getViewController(weatherService)
        await viewController.getAndSetCurrentWeather()

        // assert.
        XCTAssertEqual(viewController.currentWeather.text, expectedWeather)
    }

    func getViewController(_ weatherService: WeatherService) -> FizzBuzzViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        viewController = storyboard.instantiateViewController(identifier: String(describing: FizzBuzzViewController.self)) { coder in
            FizzBuzzViewController(coder: coder, weatherService)
        }
        viewController.loadViewIfNeeded()

        return viewController
    }

    func testButtonPressShouldUpdateUi() throws {
        viewController.input.text = "1"

        viewController.button.sendActions(for: .touchUpInside)

        XCTAssertEqual(viewController.label.text, "1")
        XCTAssertNil(viewController.label.backgroundColor)
    }
}
