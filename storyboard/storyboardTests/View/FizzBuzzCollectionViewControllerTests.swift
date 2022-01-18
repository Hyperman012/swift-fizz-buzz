import Foundation
import XCTest
@testable import storyboard

public class FizzBuzzCollectionViewControllerTests: XCTestCase {
    
    public func testShouldExist() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: String(describing: FizzBuzzCollectionViewController.self))
        viewController.loadViewIfNeeded()
        
        XCTAssertNotNil(viewController)
    }
    
    public func testShouldContainDataSource() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController : UICollectionViewController = storyboard.instantiateViewController(identifier: String(describing: FizzBuzzCollectionViewController.self))
        viewController.loadViewIfNeeded()
    
        XCTAssertTrue(viewController.collectionView?.dataSource is FizzBuzzCollectionViewController)
    }
}
