import XCTest
import Foundation


class NotificationCenterObserver {
    var subscriber: Any!
    var latestMessage = ""

    init() {
        subscriber = NotificationCenter.default.addObserver(self, selector: #selector(updateMessage(_:)), name: NSNotification.Name("m1"), object: nil)
    }

    @objc private func updateMessage(_ message: Notification)
    {
        latestMessage = message.object as! String
    }

    func addMessage(_ message: String) {
        NotificationCenter.default.post(name: NSNotification.Name("m1"), object: message)
    }

    func readReceivedMessage() -> String {
        latestMessage
    }
}

class NotificationCenterObserverTests: XCTestCase {

    public func testShouldAddNotification() {
        // arrange.
        let expectedMessage = "string"

        let notificationName = NSNotification.Name("m1")

        let notification = XCTNSNotificationExpectation(name: notificationName, object: expectedMessage)

        // act.
        NotificationCenterObserver().addMessage(expectedMessage)

        // assert.
        let result = XCTWaiter.wait(for: [notification], timeout: 1)
        XCTAssertTrue(result == .completed)
    }

    public func testShouldReceiveMessage() {
        // arrange.
        let expectedMessage = "string"

        let notificationName = NSNotification.Name("m1")
        let notification = XCTNSNotificationExpectation(name: notificationName, object: expectedMessage)

        let observer = NotificationCenterObserver()
        observer.addMessage(expectedMessage)
        _ = XCTWaiter.wait(for: [notification], timeout: 1)

        // act.
        let actualMessage = observer.readReceivedMessage()

        // assert.
        XCTAssertEqual(expectedMessage, actualMessage)
    }
}
