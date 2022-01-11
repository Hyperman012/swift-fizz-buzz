import Foundation
import XCTest

class PublishedObservable: ObservableObject {
    @Published var data: String?

    @Published var otherData: String?

    public func updateData() async {
        data = "message"
    }

    func updateOtherData() async {
        otherData = "something"
    }
}

class PublishedObserverTests: XCTestCase {

    func testShouldBeObservable() async {
        //arrange
        let observable = PublishedObservable()
        var called = false
        let cancellable = observable.objectWillChange.sink {
            called = true
        }

        //act
        let task = Task.detached(priority: TaskPriority.background) {
           await observable.updateData()
        }

        _ = await task.result

        //assert
        XCTAssertTrue(called)
    }

    func testShouldSendTwoEvents() async {
        //arrange
        let observable = PublishedObservable()
        var called = 0
        let cancellable = observable.objectWillChange.sink {
            called += 1
        }

        //act
        let task = Task.detached(priority: TaskPriority.background) {
            await observable.updateData()
            await observable.updateData()
        }

        _ = await task.result

        //assert
        XCTAssertEqual(called, 2)
    }

    func testShouldBeAbleToObserveField() async {
        //arrange
        let observable = PublishedObservable()
        var called = false

        let cancellable = observable.$data.sink { value in
            called = true
        }

        //act
        let task = Task.detached(priority: TaskPriority.background) {
            await observable.updateData()
        }

        _ = await task.result

        //assert
        XCTAssertTrue(called)
    }

    func testShouldOnlyUpdateFieldWhenThatFieldIsUpdated() async {
        //arrange
        let observable = PublishedObservable()

        var called = 0
        let cancellable = observable.$data.sink { value in
            called += 1
        }

        //act
        let task = Task.detached(priority: TaskPriority.background) {
            await observable.updateOtherData()
        }

        _ = await task.result

        //assert
        XCTAssertEqual(called, 1)
    }
}
