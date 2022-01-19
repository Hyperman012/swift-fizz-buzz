import Foundation
import UIKit

class FizzBuzzRowView : UIStackView {
    let input: CustomLabel
    let output: CustomLabel

    override init(frame: CGRect) {
        input = CustomLabel()
        output = CustomLabel()

        super.init(frame: frame)

        axis = .horizontal
        spacing = 10
        addArrangedSubview(input)
        addArrangedSubview(output)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
