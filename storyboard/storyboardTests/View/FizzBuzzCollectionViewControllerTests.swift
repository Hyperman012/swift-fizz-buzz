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
        assertCellsHaveInputAndOutput(section: 0, input: "1", result: "1")
    }

    public func testShouldHave2ForSecondItem() {
        assertCellsHaveInputAndOutput(section: 1, input: "2", result: "2")
    }

    public func testShouldHaveFizzForThirdItemResult() {
        assertCellsHaveInputAndOutput(section: 2, input: "3", result: "fizz")
    }

    private func assertCellsHaveInputAndOutput(section: Int, input: String, result: String) {
        let inputCell = createFizzBuzzCell(IndexPath(item: 0, section: section))
        let resultCell = createFizzBuzzCell(IndexPath(item: 1, section: section))

        XCTAssertEqual(inputCell.label.text, input)
        XCTAssertEqual(resultCell.label.text, result)
    }

    private func createFizzBuzzCell(_ indexPathInput: IndexPath) -> FizzBuzzViewCell {
        viewController.collectionView(viewController.collectionView, cellForItemAt: indexPathInput) as! FizzBuzzViewCell
    }
}
