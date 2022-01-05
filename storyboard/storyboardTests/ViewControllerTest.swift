import XCTest
@testable import storyboard

class ViewControllerTest: XCTestCase {
    var viewController: ViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
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
        XCTAssertNotNil(viewController.button)
    }

    func testShouldHaveInputBox() throws {
        XCTAssertNotNil(viewController.input)
    }

    func testButtonShouldDisplayErrorForNonNumberInput() throws {
        viewController.button.sendActions(for: .touchUpInside)

        XCTAssertEqual(viewController.label.text, "Error invalid input")
        XCTAssertEqual(viewController.label.backgroundColor, viewController.backgroundColor)
    }

    func testLabelIsBoundToLabel() throws {

        // arrange.
        let defaultBackgroundColor = viewController.label.backgroundColor
        viewController.label.backgroundColor = viewController.backgroundColor

        viewController.input.text = "1"

        // act.
        viewController.button.sendActions(for: .touchUpInside)

        // assert.
        XCTAssertEqual(viewController.label.backgroundColor, defaultBackgroundColor)
    }

    func testButtonShouldClearErrorStyleOnceGivenValidInput() throws {
        // arrange.
        let defaultBackgroundColor = viewController.label.backgroundColor
        viewController.label.backgroundColor = viewController.backgroundColor

        viewController.input.text = "1"

        // act.
        viewController.button.sendActions(for: .touchUpInside)

        // assert.
        XCTAssertEqual(viewController.label.backgroundColor, defaultBackgroundColor)
    }

    func testButtonShouldPutInputInOutput() throws {
        viewController.input.text = "1"

        viewController.button.sendActions(for: .touchUpInside)

        XCTAssertEqual(viewController.label.text, "1")
    }

    func testButtonShouldPrintFizzForInput3() throws {
        viewController.input.text = "3"

        viewController.button.sendActions(for: .touchUpInside)

        XCTAssertEqual(viewController.label.text, "fizz")
    }
}
