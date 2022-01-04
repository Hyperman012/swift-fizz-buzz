import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(text)
            .padding()
        TextField("number", text: $number)
        Button(action: {self.text = "output"}) {
            Text("Do the things")
        }

    }
    @State public var text: String = "Fizzbuzz"
    @State private var number: String = "default"
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
