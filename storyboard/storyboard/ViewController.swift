import UIKit

class ViewController: UIViewController {

    @IBOutlet private(set) var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClick() {
        print("hello world")
    }
    
}
