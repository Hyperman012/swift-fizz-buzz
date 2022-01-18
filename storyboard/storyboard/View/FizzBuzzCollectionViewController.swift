import Foundation
import UIKit
import FizzBuzz

public class FizzBuzzCollectionViewController: UICollectionViewController {
    var dataSource: [Int:String?] = [:]

    public required init?(coder: NSCoder) {
        super.init(coder: coder)

        (1...100).forEach { dataSource[$0] = "" }
        FizzyBuzzy().calculate(&dataSource)
    }
}

public extension FizzBuzzCollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath ) -> UICollectionViewCell {
        let input = indexPath.section + 1
        let isResultColumn = indexPath.item == 1

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fizzbuzz", for: indexPath) as! FizzBuzzViewCell
        
        cell.with(text: String(input))

        if isResultColumn {
            cell.with(text: dataSource[input]!!)
        }
        
        return cell
    }
}
 
