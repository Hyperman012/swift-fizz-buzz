import XCTest
@testable import storyboard

class FizzyBuzzyServiceTests: XCTestCase {
    var service: FizzyBuzzyService!

    override func setUpWithError() throws {
        service = FizzyBuzzyService()
    }

    override func tearDownWithError() throws {
        service = nil
        try super.tearDownWithError()
    }

    func testAsJsonShouldFizzReturnJson() {
        let expectedResult = FizzBuzzReturn(result: "fizz")
        let input = FizzBuzzInput(input: 3)
        let inputString = try? JSONEncoder().encode(input)
        
        let result = service.calculateAsJson(String(data: inputString!, encoding: .utf8)!)
        
        let actualResult = try? JSONDecoder().decode(FizzBuzzReturn.self, from: result.data(using: .utf8)!)
        
        XCTAssertEqual(actualResult, expectedResult)
   }
   
   func testAsJsonShouldReturnOne() {
       let expectedResult = FizzBuzzReturn(result: "1")
       let input = FizzBuzzInput(input: 1)
       let inputString = try? JSONEncoder().encode(input)
       
       let result = service.calculateAsJson(String(data: inputString!, encoding: .utf8)!)
       
       let actualResult = try? JSONDecoder().decode(FizzBuzzReturn.self, from: result.data(using: .utf8)!)
       
       XCTAssertEqual(actualResult, expectedResult)
   }

}
