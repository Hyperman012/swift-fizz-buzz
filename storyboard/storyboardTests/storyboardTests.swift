import XCTest
@testable import storyboard

class storyboardTests: XCTestCase {
    var sut: ViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil

        try super.tearDownWithError()
    }

    func testShouldPrintFizzBuzz() throws {
        XCTAssertEqual(sut.label.text, "Fizzbuzz");
    }

    func testShouldShowButton() throws {
        XCTAssertNotNil(sut.button)
    }

    func testShouldHaveInputBox() throws {
        XCTAssertNotNil(sut.input)
    }

    func testButtonShouldModifyText() throws {
        sut.button.sendActions(for: .touchUpInside)

        XCTAssertEqual(sut.label.text, "Input");
    }

    func testButtonShouldPutInputInOutput() throws {
        sut.input.text = "1"

        sut.button.sendActions(for: .touchUpInside)

        XCTAssertEqual(sut.label.text, "1")
    }

    func testButtonShouldPrintFizzForInput3() throws {
        sut.input.text = "3"

        sut.button.sendActions(for: .touchUpInside)

        XCTAssertEqual(sut.label.text, "fizz")
    }
}
