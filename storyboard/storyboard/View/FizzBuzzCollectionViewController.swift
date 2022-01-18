import Foundation
import UIKit

public class FizzBuzzCollectionViewController: UICollectionViewController {
}

public extension FizzBuzzCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
      return 1
    }
    
    // 2
    override func collectionView(
      _ collectionView: UICollectionView,
      numberOfItemsInSection section: Int
    ) -> Int {
      return 1
    }
    
    // 3
    override func collectionView(
      _ collectionView: UICollectionView,
      cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: "fizzbuzz",
        for: indexPath)
      cell.backgroundColor = .black
      // Configure the cell
      return cell
    }
}
 
