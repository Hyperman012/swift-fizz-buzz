import UIKit

class WeatherService {
    func getCurrentWeather(_ model: WeatherModel) {
        Thread.sleep(forTimeInterval: 5)

        model.condition = "Hazy/Lazy"
    }
}

class ViewController: UIViewController {
    public var city: CustomLabel!

    public var condition: CustomLabel!

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
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.spacing = 10
        
        stack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    func labelStack() {
        let fizzBuzzStack = FizzBuzzRowView()

        fizzBuzzStack.input.setText("Input")
        fizzBuzzStack.output.setText("Output")

        let stack = UIStackView()
        stack.addArrangedSubview(fizzBuzzStack)

        view.addSubview(stack)

        labelStackLayout(view, stack)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //labelStack()
        createWeather()
    }

    private func createWeather() {
        let weatherView = UIStackView()
        weatherView.translatesAutoresizingMaskIntoConstraints = false

        city = CustomLabel()
        city.setText("City")

        condition = CustomLabel()
        var model = WeatherModel()
        WeatherService().getCurrentWeather(model)
        condition.setText(model.condition!)


        weatherView.addArrangedSubview(city)
        weatherView.addArrangedSubview(condition)

        view.addSubview(weatherView)
        weatherView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        weatherView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

class WeatherModel : ObservableObject {
    var condition : String?
}

