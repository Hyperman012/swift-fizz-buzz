import Foundation
import UIKit

struct FizzBuzzViewModel {
    let text: String
    let background: UIColor?

    init(text: String, background: UIColor?) {
        self.text = text
        self.background = background
    }
}
