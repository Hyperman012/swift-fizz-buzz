import XCTest
@testable import storyboard

class JsonHelperTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testShouldDecodeJsonString() throws {
        // arrange.
        let jsonHelper = JsonHelper()
        
        let jsonString = "{}"
        
        let expectedResult = MyJsonObject()
        
        // act.
        let result = jsonHelper.decode(jsonString, MyJsonObject.self)
        
        // assert.
        XCTAssertEqual(result, expectedResult)
    }
    
    func testShouldDecodeJsonStringWithData() throws {
        // arrange.
        let jsonHelper = JsonHelper()
        
        let jsonString = "{\"data\": \"something\"}"
        
        let expectedResult = MyJsonObject(data: "something")
        
        // act.
        let result = jsonHelper.decode(jsonString, MyJsonObject.self)
        
        // assert.
        XCTAssertEqual(result, expectedResult)
    }
    
    func testShouldDecodeJsonStringWithRequiredData() throws {
        // arrange.
        let jsonHelper = JsonHelper()
        
        let jsonString = "{\"required\": \"something\"}"
        
        let expectedResult = JsonObjectWithRequiredField(required: "something")
        
        // act.
        let result = jsonHelper.decode(jsonString, JsonObjectWithRequiredField.self)
        
        // assert.
        XCTAssertEqual(result, expectedResult)
    }
    
    
//    func testShouldReturnNilWhenJsonDoesNotMatchType() throws {
//        // arrange.
//        let jsonHelper = JsonHelper()
//
//        let jsonString = "{\"non-existing-field\": \"something\"}"
//
//        // act.
//        let result = jsonHelper.decode(jsonString, JsonObjectWithRequiredField.self)
//
//        // assert.
//        XCTAssertNil(result)
//    }
}

public struct MyJsonObject: Codable, Equatable {
    var data: String?
}
struct JsonObjectWithRequiredField: Codable, Equatable {
    var required: String
}

