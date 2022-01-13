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

        XCTAssert(text.exists)
    }

    func testShouldShowButton() throws {
        let app = XCUIApplication()
        app.launch()

        let button = app.buttons["Do the things"]

        XCTAssert(button.exists)
    }

    func testShouldHaveInputBox() throws {
        let app = XCUIApplication()
        app.launch()

        let input = app.textFields["number"]

        XCTAssert(input.exists)
    }
}
