import XCTest
import ViewInspector
@testable import SwiftUIFizzBuzz

extension ContentView: Inspectable { }


class ContentViewTests: XCTestCase {

    var view = ContentView()

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
        let exp = view.on(\.didAppear) { view in
            try view.button(2).tap()
            XCTAssertEqual(try view.actualView().text, "output")
        }

        ViewHosting.host(view: view)
        wait(for: [exp], timeout: 0.1)
    }
}
