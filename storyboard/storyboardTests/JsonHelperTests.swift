import XCTest
@testable import storyboard

class JsonHelperTests: XCTestCase {
    
    let emptyJson = "{}"
    let jsonWithOptionalData = "{\"optional\":\"something\"}"

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testShouldDecodeJsonString() throws {
        // arrange.
        let jsonHelper = JsonHelper()
        
        let expectedResult = JsonObjectWithOptionalField()
        
        // act.
        let result = jsonHelper.decode(emptyJson, JsonObjectWithOptionalField.self)
        
        // assert.
        XCTAssertEqual(result, expectedResult)
    }
    
    func testShouldDecodeJsonStringWithOptionalData() throws {
        // arrange.
        let jsonHelper = JsonHelper()
        
        let expectedResult = JsonObjectWithOptionalField(optional: "something")
        
        // act.
        let result = jsonHelper.decode(jsonWithOptionalData, JsonObjectWithOptionalField.self)
        
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
    
    
    func testShouldDecodeToNilWhenJsonDoesNotMatchType() throws {
        // arrange.
        let jsonHelper = JsonHelper()

        let jsonString = "{\"non-existing-field\": \"something\"}"

        // act.
        let result = jsonHelper.decode(jsonString, JsonObjectWithRequiredField.self)

        // assert.
        XCTAssertNil(result)
    }
    
    func testShouldEncodeEmptyType() throws {
        let jsonHelper = JsonHelper()
        let toEncode = JsonObjectWithOptionalField()
        
        let result = jsonHelper.encode(toEncode)
        
        XCTAssertEqual(result, emptyJson)
    }
    
    func testShouldEncodeTypeWithData() throws {
        let jsonHelper = JsonHelper()
        let toEncode = JsonObjectWithOptionalField(optional: "something")
        
        let result = jsonHelper.encode(toEncode)
        
        XCTAssertEqual(result, jsonWithOptionalData)
    }
}

struct JsonObjectWithOptionalField: Codable, Equatable {
    var optional: String?
}
struct JsonObjectWithRequiredField: Codable, Equatable {
    var required: String
}
