import Foundation
import XCTest
@testable import HelloWorld

class CustomLabelTests: XCTestCase {

    public func testShouldSetText() {
        // arrange.
        let label = CustomLabel()

        // act.
        label.text = "expected"

        // assert.
        XCTAssertEqual(label.text, "expected")
    }
}
