import UIKit

class ViewController: UIViewController {

    fileprivate func blueRedStack() {
        let stack = UIStackView()

        let view = UIView()
        view.backgroundColor = .red
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        let view2 = UIView()
        view2.backgroundColor = .blue
        view2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.spacing = 10
        
        stack.addArrangedSubview(view)
        stack.addArrangedSubview(view2)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stack)
        stack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    fileprivate func labelStackLayout(_ view: UIView, _ stack: UIStackView) {
        view.widthAnchor.constraint(equalTo: stack.widthAnchor).isActive = true
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.spacing = 10
        
        stack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    func labelStack() {
        let fizzBuzzInput = CustomLabel()
        let fizzBuzzOutput = CustomLabel()
        let fizzBuzzStack = UIStackView()

        fizzBuzzStack.axis = .horizontal
        fizzBuzzStack.spacing = 10
        fizzBuzzStack.addArrangedSubview(fizzBuzzInput)
        fizzBuzzStack.addArrangedSubview(fizzBuzzOutput)

        let view = UIView()
        view.backgroundColor = .orange
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true

        let outputLabel = UILabel()
        outputLabel.text = "Output"

        let stack = UIStackView()
        stack.addArrangedSubview(fizzBuzzStack)
        stack.addArrangedSubview(view)
        stack.addArrangedSubview(outputLabel)
        
        self.view.addSubview(stack)
        
        labelStackLayout(view, stack)

        fizzBuzzInput.setText(newText: "Hello World")
        fizzBuzzOutput.setText(newText: "Bye")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelStack()
    }


}

