import UIKit
import fizzBuzzKata

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet private(set) var button: UIButton!

    @IBOutlet weak var input: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClick() {
        let fizzyBuzzy = FizzyBuzzy(ThreeStrategy(), FiveStrategy())
        label.text = fizzyBuzzy.calculate(input.text)
    }
    
}
