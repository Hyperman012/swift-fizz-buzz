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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fizzbuzz", for: indexPath)
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 50))
        
        if indexPath.item == 0 {
            title.text = String(row)
        }
        else
        {
            title.text = FizzyBuzzy().calculate(row)
        }
        
        title.font = UIFont(name: "AvenirNext-Bold", size: 15)
        title.textAlignment = .center
        cell.contentView.addSubview(title)
        
        return cell
    }
}
 
