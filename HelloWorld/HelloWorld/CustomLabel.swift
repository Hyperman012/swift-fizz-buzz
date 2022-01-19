import Foundation
import UIKit

class CustomLabel: UIView {
    var label = UILabel()

    public var text: String {
        get {
            label.text ?? ""
        }
        set(text) {
            label.text = text
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        //Markup
        addSubview(label)

        //Design
        //label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: label.heightAnchor).isActive = true
        widthAnchor.constraint(equalTo: label.widthAnchor).isActive = true
    }

    public func setText(_ newText: String) {
        label.text = newText
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
