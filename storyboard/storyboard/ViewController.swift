import UIKit
import fizzBuzzKata

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet private(set) var button: UIButton!

    @IBOutlet weak var input: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    public let backgroundColor: UIColor = UIColor.red

    @IBAction func buttonClick() {
        let fizzyBuzzy = FizzyBuzzy(ThreeStrategy(), FiveStrategy())
        let inputNumber = Int(input.text!)

        if (inputNumber != nil) {
            label.text = fizzyBuzzy.calculate(inputNumber!)
            label.backgroundColor = nil
        }
        else {
            label.text = "Error invalid input"
            label.backgroundColor = UIColor.red;
        }
    }
    
}

