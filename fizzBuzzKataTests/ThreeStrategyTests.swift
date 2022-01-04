import XCTest
@testable import fizzBuzzKata

class ThreeStrategyTests: XCTestCase {

    private var testObj: ThreeStrategy!

    override func setUpWithError() throws {
        testObj = ThreeStrategy()
    }

    func testShouldReturnTrueForThree(){
        let result = testObj.evaluate(3)

        XCTAssertTrue(result)
    }

    func testShouldReturnFalseForTwo(){
        let result = testObj.evaluate(2)

        XCTAssertFalse(result)
    }

    func testShouldReturnTrueForMultiplesOfThree() {
        let result = testObj.evaluate(3 * 2)

        XCTAssertTrue(result)
    }
}
