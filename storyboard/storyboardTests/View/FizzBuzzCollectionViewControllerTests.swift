import Foundation
import XCTest
@testable import storyboard

public class FizzBuzzCollectionViewControllerTests: XCTestCase {
    
    public func testShouldBindCollectionViewToData() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: String(describing: FizzBuzzCollectionViewController.self))
        viewController.loadViewIfNeeded()
        
        XCTAssertNotNil(viewController)
    }
}
