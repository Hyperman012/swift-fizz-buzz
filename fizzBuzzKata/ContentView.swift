import SwiftUI

struct ContentView: View {
    @State public var text: String = "Fizzbuzz"
    @State private var number: String = "default"

    public var didAppear: ((Self) -> Void)? // 1.

    var body: some View {
        Text(text)
            .padding()
        TextField("number", text: $number)
        Button(action: {
            self.text = "output"
        }, label: { Text("Do the things") })
                .onAppear { self.didAppear?(self) }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
