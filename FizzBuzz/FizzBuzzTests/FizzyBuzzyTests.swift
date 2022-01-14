import XCTest
@testable import FizzBuzz

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

    func testShouldReturnOneForIntOneUsingStubsProtocol() {
        testObj = FizzyBuzzy(FalseStrategyProtocol(), FalseStrategyProtocol())

        let result = testObj.calculate(1);

        XCTAssertEqual(result, "1");
    }
    
    func testShouldReturn3For3UsingStubsOverride() {
        testObj = FizzyBuzzy(ThreeStrategyStub(), FalseStrategyProtocol())

        let result = testObj.calculate(3);

        XCTAssertEqual(result, "3");
    }
    
    func testShouldReturnFizzFor3UsingSpy() {
        
        let spy = ThreeStrategySpy()
        testObj = FizzyBuzzy(spy, FalseStrategyProtocol())

        let _ = testObj.calculate(3);

        XCTAssertEqual(spy.timesCalled, 2);
    }
    
    func testShouldFizzBuzzAList(){
        let expected = ["1","2"]
        let input = [1,2]
        let actualResult = testObj.calculate(input)
        XCTAssertEqual(actualResult, expected)
    }
    func testShouldFizzBuzzAListWithFizz(){
        let expected = ["2","fizz"]
        let input = [2,3]
        let actualResult = testObj.calculate(input)
        XCTAssertEqual(actualResult, expected)
    }

    func testShouldFizzBuzzWithNoItems() {
        let expected: [String] = []
        let input: [Int] = []
        let actualResult = testObj.calculate(input)
        XCTAssertEqual(actualResult, expected)
    }
    
}

class TrueStrategyProtocol: StrategyProtocol {
    func evaluate(_ input: Int) -> Bool {
        true
    }
}

class FalseStrategyProtocol: StrategyProtocol {
    func evaluate(_ input: Int) -> Bool {
        false
    }
}

class ThreeStrategyStub : ThreeStrategy {
    override func evaluate(_ input: Int) -> Bool {

        if (input % 3 == 0) {
            return false
        }
        
        return true
    }
}

class ThreeStrategySpy : ThreeStrategy {
    var timesCalled = 0
    override func evaluate(_ input: Int) -> Bool {

        timesCalled+=1
        
        return super.evaluate(input);
        
    }
}
