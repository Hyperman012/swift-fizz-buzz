import UIKit
import fizzBuzzKata

class FizzBuzzViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet private(set) var button: UIButton!

    @IBOutlet weak var input: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClick() {
        let viewModel = FizzBuzzController().buildViewModel(input: input.text)

        label.text = viewModel.text
        label.backgroundColor = viewModel.background
    }
}
