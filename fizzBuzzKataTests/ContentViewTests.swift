import XCTest
import ViewInspector
@testable import fizzBuzzKata
extension ContentView: Inspectable { }


class ContentViewTests: XCTestCase {

    let view = ContentView()

    func testShouldPrintFizzBuzz() throws {
        let button = try view.inspect().find(text: "Fizzbuzz")

        XCTAssertNotNil(button)
    }

    func testShouldShowButton() throws {
        let button = try view.inspect().find(button: "Do the things")

        XCTAssertNotNil(button)
    }

    func testShouldHaveInputBox() throws {
        let input = try view.inspect().find(text: "number")

        XCTAssertNotNil(input)
    }

    func testButtonShouldModifyText() throws {
        try view.inspect().find(button: "Do the things").tap()

        XCTAssertEqual(view.text, "default")
    }

}
