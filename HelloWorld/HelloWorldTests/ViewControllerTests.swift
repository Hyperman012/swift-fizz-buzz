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

    @MainActor func testShouldUpdateModelWithCurrentCondition() async throws {
        let viewController = ViewController()
        await viewController.updateModelWithCurrentCondition()

        XCTAssertEqual(viewController.model.condition, "Hazy/Lazy")
    }

    func testShouldUpdateLabelWhenModelIsUpdated() throws {
        let viewController = ViewController()
        viewController.scheduler = DispatchQueue(label: "MyScheduler")

        viewController.loadViewIfNeeded()
        viewController.model.condition = "Hazy/Lazy"

        viewController.scheduler.sync {}

        XCTAssertEqual(viewController.condition.text, "Hazy/Lazy")
    }
}
