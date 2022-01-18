import Foundation
import XCTest
@testable import storyboard

public class FizzBuzzCollectionViewControllerTests: XCTestCase {
    var viewController: FizzBuzzCollectionViewController!

    public override func setUpWithError() throws {
        try super.setUpWithError()
        viewController = createViewController()
    }

    public override func tearDownWithError() throws {
        try super.tearDownWithError()
        viewController = nil
    }

    public func testShouldExist() {
        XCTAssertNotNil(viewController)
    }
    
    public func testShouldContainDataSource() {
        XCTAssertTrue(viewController.collectionView?.dataSource is FizzBuzzCollectionViewController)
    }

    private func createViewController() -> FizzBuzzCollectionViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController : UICollectionViewController
                = storyboard.instantiateViewController(identifier: String(describing: FizzBuzzCollectionViewController.self))
        viewController.loadViewIfNeeded()
        return viewController as! FizzBuzzCollectionViewController
    }

    public func testShouldHave1ForFirstItem() {
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = viewController.collectionView(viewController.collectionView, cellForItemAt: indexPath) as! FizzBuzzViewCell

        XCTAssertEqual(cell.label.text, "1")
    }

    public func testShouldHave2ForSecondItem() {
        let indexPath = IndexPath(row: 0, section: 1)
        let cell = viewController.collectionView(viewController.collectionView, cellForItemAt: indexPath) as! FizzBuzzViewCell

        XCTAssertEqual(cell.label.text, "2")
    }

    public func testShouldHaveFizzForThirdItemResult() {
        let inputCell = createFizzBuzzCell(IndexPath(item: 0, section: 2))
        let resultCell = createFizzBuzzCell(IndexPath(item: 1, section: 2))

        XCTAssertEqual(inputCell.label.text, "3")
        XCTAssertEqual(resultCell.label.text, "fizz")
    }

    private func createFizzBuzzCell(_ indexPathInput: IndexPath) -> FizzBuzzViewCell {
        viewController.collectionView(viewController.collectionView, cellForItemAt: indexPathInput) as! FizzBuzzViewCell
    }
}
