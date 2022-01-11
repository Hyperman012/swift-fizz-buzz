import UIKit

class FizzBuzzViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet private(set) var button: UIButton!

    @IBOutlet var currentWeather: UILabel!
    @IBOutlet var input: UITextField!
    let weatherService: WeatherService;

    @IBOutlet var currentCity : UILabel!

    init?(coder: NSCoder, _ service: WeatherService) {
        weatherService = service
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        weatherService = WeatherService()
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        let task = Task.detached(priority: TaskPriority.userInitiated) { [self] in
            await getAndSetCurrentWeather()
        }
        super.viewDidLoad()
    }

    func getAndSetCurrentWeather() async {
        let weatherViewModel = await WeatherController().buildViewModel(weatherService)
        currentWeather.text = weatherViewModel.currentCondition
    }

    @IBAction func buttonClick() {
        let viewModel = FizzBuzzController().buildViewModel(input: input.text)

        label.text = viewModel.text
        label.backgroundColor = viewModel.background
    }
}
