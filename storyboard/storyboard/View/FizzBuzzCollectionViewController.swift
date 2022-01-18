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
        let row = indexPath.section
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fizzbuzz", for: indexPath) as! FizzBuzzViewCell
        
        cell.with(text: String(row+1))
        
        return cell
    }
}
 
