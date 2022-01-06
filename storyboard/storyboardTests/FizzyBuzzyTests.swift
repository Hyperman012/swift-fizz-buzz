import XCTest
@testable import storyboard

class FizzyBuzzyTests: XCTestCase {
    var testObj: FizzyBuzzy!

    override func setUpWithError() throws {
        testObj = FizzyBuzzy(ThreeStrategy(), FiveStrategy())
    }

    override func tearDownWithError() throws {
        testObj = nil
        try super.tearDownWithError()
    }

    func testShouldReturnOneForIntOne() {
        let result = testObj.calculate(1);

        XCTAssertEqual(result, "1");
    }

    func testShouldReturnTwoForIntTwo() {
        let result = testObj.calculate(2);

        XCTAssertEqual(result, "2");
    }

    func testShouldReturnFizzForIntThree() {
        let result = testObj.calculate(3)

        XCTAssertEqual(result, "fizz");
    }

    func testShouldReturnFizzForMultiplesOfThree() {
        let result = testObj.calculate(3 * 2)

        XCTAssertEqual(result, "fizz");
    }

    func testShouldReturnBuzzForIntFive() {
        let result = testObj.calculate(5)

        XCTAssertEqual(result, "buzz");
    }

    func testShouldReturnFizzForMultiplesOfFive() {
        let result = testObj.calculate(5 * 2)

        XCTAssertEqual(result, "buzz");
    }

    func testShouldReturnFizzBuzzForMultiplesOf3And5() {
        let result = testObj.calculate(3 * 5)

        XCTAssertEqual(result, "fizzbuzz");
    }

    func testShouldReturnFizzBuzzForAllMultiplesOf3And5() {
        let result = testObj.calculate(3 * 5 * 10)

        XCTAssertEqual(result, "fizzbuzz");
    }

}
