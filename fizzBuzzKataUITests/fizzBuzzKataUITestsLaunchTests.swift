import XCTest

class fizzBuzzKataUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        false
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
    }

    func testShouldPrintFizzBuzz() throws {
        let app = XCUIApplication()
        app.launch()

        let text = app.staticTexts["Fizzbuzz"];

        XCTAssert(text.exists);
    }
}
