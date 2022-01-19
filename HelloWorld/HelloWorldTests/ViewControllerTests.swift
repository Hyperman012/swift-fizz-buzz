import XCTest
@testable import HelloWorld

class ViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShouldHaveCityLabel() throws {
        let viewController = ViewController()
        viewController.loadViewIfNeeded()

        XCTAssertEqual(viewController.city.text, "City")
    }

    func testShouldHaveConditionLabel() throws {
        let viewController = ViewController()
        viewController.loadViewIfNeeded()

        XCTAssertEqual(viewController.condition.text, "Hazy/Lazy")
    }
}
