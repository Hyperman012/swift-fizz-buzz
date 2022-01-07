import XCTest
@testable import storyboard

class JsonUtf8FacadeTests: XCTestCase {
    var jsonHelper : JsonUtf8Facade!
    let emptyJson = "{}"
    let jsonWithOptionalData = "{\"optional\":\"something\"}"

    override func setUpWithError() throws {
        jsonHelper = JsonUtf8Facade()
    }

    override func tearDownWithError() throws {
        jsonHelper = nil
        try super.tearDownWithError()
    }

    func testShouldDecodeJsonString() throws {
        // arrange.
        let expectedResult = JsonObjectWithOptionalField()
        
        // act.
        let result = jsonHelper.decodeToType(emptyJson, JsonObjectWithOptionalField.self)
        
        // assert.
        XCTAssertEqual(result, expectedResult)
    }
    
    func testShouldDecodeJsonData() throws {
        // arrange.
        let expectedResult = JsonObjectWithOptionalField()
        
        let data = emptyJson.data(using: .utf8)!
        
        // act.
        let result = jsonHelper.decodeToType(data, JsonObjectWithOptionalField.self)
        
        // assert.
        XCTAssertEqual(result, expectedResult)
    }
    
    func testShouldDecodeJsonStringWithOptionalData() throws {
        // arrange.
        let expectedResult = JsonObjectWithOptionalField(optional: "something")
        
        // act.
        let result = jsonHelper.decodeToType(jsonWithOptionalData, JsonObjectWithOptionalField.self)
        
        // assert.
        XCTAssertEqual(result, expectedResult)
    }
    
    func testShouldDecodeJsonStringWithRequiredData() throws {
        // arrange.
        let jsonString = "{\"required\": \"something\"}"
        
        let expectedResult = JsonObjectWithRequiredField(required: "something")
        
        // act.
        let result = jsonHelper.decodeToType(jsonString, JsonObjectWithRequiredField.self)
        
        // assert.
        XCTAssertEqual(result, expectedResult)
    }
    
    
    func testShouldDecodeToNilWhenJsonDoesNotMatchType() throws {
        // arrange.
        let jsonString = "{\"non-existing-field\": \"something\"}"

        // act.
        let result = jsonHelper.decodeToType(jsonString, JsonObjectWithRequiredField.self)

        // assert.
        XCTAssertNil(result)
    }
    
    func testShouldEncodeEmptyType() throws {
        let toEncode = JsonObjectWithOptionalField()
        
        let result = try? jsonHelper.encodeToJsonString(toEncode)
        
        XCTAssertEqual(result, emptyJson)
    }
    
    func testShouldEncodeTypeWithData() throws {
        let toEncode = JsonObjectWithOptionalField(optional: "something")
        
        let result = try? jsonHelper.encodeToJsonString(toEncode)
        
        XCTAssertEqual(result, jsonWithOptionalData)
    }
    
    func testShouldThrowExceptionOnInvalidData() throws {
        let toEncode = JsonObjectWithFloatField(number: Float.infinity)
        
        XCTAssertThrowsError(try jsonHelper.encodeToJsonString(toEncode))
    }
}

struct JsonObjectWithOptionalField: Codable, Equatable {
    var optional: String?
}
struct JsonObjectWithRequiredField: Codable, Equatable {
    var required: String
}
struct JsonObjectWithFloatField: Codable, Equatable {
    var number: Float
}
