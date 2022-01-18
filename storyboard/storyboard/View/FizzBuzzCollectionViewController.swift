import Foundation
import UIKit
import FizzBuzz

public class FizzBuzzCollectionViewController: UICollectionViewController {
}

public extension FizzBuzzCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath ) -> UICollectionViewCell {
        let input = indexPath.section + 1
        let result: Int = indexPath.item

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fizzbuzz", for: indexPath) as! FizzBuzzViewCell
        
        cell.with(text: String(input))
        
        if (input == 3 && result == 1) {
            cell.with(text: "fizz")
        }
        
        return cell
    }
}
 
