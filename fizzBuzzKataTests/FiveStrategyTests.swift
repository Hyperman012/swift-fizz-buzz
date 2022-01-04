import XCTest
@testable import fizzBuzzKata

class FiveStrategyTests: XCTestCase {

    private var testObj: FiveStrategy!

    override func setUpWithError() throws {
        testObj = FiveStrategy()
    }

    func testShouldReturnTrueForFive(){
        let result = testObj.evaluate(5)

        XCTAssertTrue(result)
    }

    func testShouldReturnTrueForTwenty(){
        let result = testObj.evaluate(5 * 4)

        XCTAssertTrue(result)
    }

    func testShouldReturnFalseForThree(){
        let result = testObj.evaluate(3)

        XCTAssertFalse(result)
    }
}
