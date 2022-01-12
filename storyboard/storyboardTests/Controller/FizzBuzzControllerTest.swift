import XCTest
@testable import storyboard

class FizzBuzzControllerTest: XCTestCase {
    var controller: FizzBuzzController!

    override func setUpWithError() throws {
        controller = FizzBuzzController()
    }

    override func tearDownWithError() throws {
        controller = nil
        try super.tearDownWithError()
    }

    func testBuildingViewModelGeneratesFizzForIntThree() throws {
        let viewModel = controller.buildViewModel(input: "3")

        XCTAssertEqual(viewModel.text, "fizz")
    }

    func testBuildingViewModelGenerates1ForIntOne() throws {
        let viewModel = controller.buildViewModel(input: "1")

        XCTAssertEqual(viewModel.text, "1")
    }

    func testValidInputProvidesBackgroundColorNil() throws {
        let viewModel = controller.buildViewModel(input: "1")

        XCTAssertNil(viewModel.background)
    }

    func testInvalidInputBuildsRedBackgroundColorAndError() throws {
        let viewModel = controller.buildViewModel(input: "")

        XCTAssertEqual(viewModel.text, "Error invalid input")
        XCTAssertEqual(viewModel.background, UIColor.red)
    }
}
