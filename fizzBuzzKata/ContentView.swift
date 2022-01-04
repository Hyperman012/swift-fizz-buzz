import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Fizzbuzz")
            .padding()
        TextField("number", text: $number)
        Button(action: {}) {
            Text("Do the things")
        }

    }
    @State private var number: String = "default"
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
