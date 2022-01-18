import Foundation
import XCTest
@testable import storyboard

public class FizzBuzzCollectionViewControllerTests: XCTestCase {
    
    public func testShouldExist() {
        let viewController = createViewController()
        
        XCTAssertNotNil(viewController)
    }
    
    public func testShouldContainDataSource() {
        let viewController = createViewController()

        XCTAssertTrue(viewController.collectionView?.dataSource is FizzBuzzCollectionViewController)
    }

    private func createViewController() -> UICollectionViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController : UICollectionViewController = storyboard.instantiateViewController(identifier: String(describing: FizzBuzzCollectionViewController.self))
        viewController.loadViewIfNeeded()
        return viewController
    }

    public func testShouldHave1ForFirstItem() {
        let viewController = createViewController()
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = viewController.collectionView(viewController.collectionView, cellForItemAt: indexPath) as! FizzBuzzViewCell

        XCTAssertEqual(cell.label.text, "1")
    }

    public func testShouldHave2ForSecondItem() {
        let viewController = createViewController()
        let indexPath = IndexPath(row: 0, section: 1)
        let cell = viewController.collectionView(viewController.collectionView, cellForItemAt: indexPath) as! FizzBuzzViewCell

        XCTAssertEqual(cell.label.text, "2")
    }
    
    public func testShouldHaveFizzForThirdItemResult() {
        let viewController = createViewController()
        let indexPathInput = IndexPath(item: 0, section: 2)
        let inputCell = viewController.collectionView(viewController.collectionView, cellForItemAt: indexPathInput) as! FizzBuzzViewCell
        
        let indexPath = IndexPath(item: 1, section: 2)
        let resultCell = viewController.collectionView(viewController.collectionView, cellForItemAt: indexPath) as! FizzBuzzViewCell

        XCTAssertEqual(inputCell.label.text, "3")
        XCTAssertEqual(resultCell.label.text, "fizz")
    }
}
