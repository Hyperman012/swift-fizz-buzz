import XCTest
import Foundation


class Observer {
    func addMessage(_ message: String) {
        NotificationCenter.default.post(name: NSNotification.Name("m1"), object: message)
    }
}

class ObserverTests: XCTestCase {

    public func testShouldAddNotification() {
        // arrange.
        let expectedMessage = "string"

        let notificationName = NSNotification.Name("m1")

        let notification = XCTNSNotificationExpectation(name: notificationName, object: expectedMessage)

        // act.
        let observer = Observer().addMessage(expectedMessage)

        // assert.
        let result = XCTWaiter.wait(for: [notification], timeout: 1)
        XCTAssertTrue(result == .completed)
    }
}
