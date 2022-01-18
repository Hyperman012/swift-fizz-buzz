//
//  FizzBuzzCellView.swift
//  storyboard
//
//  Created by Kody Fintak on 1/18/22.
//

import Foundation
import UIKit

public class FizzBuzzViewCell: UICollectionViewCell {
    
    @IBOutlet public var label: UILabel!
    
    public func with(text labelText: String) {
        label.text = labelText
    }
}
