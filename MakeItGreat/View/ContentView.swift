import SwiftUI

struct ContentView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack {
            Text("Welcome to (AppName)")
                .font(.title2)
                .fontWeight(.semibold)
        }
        VStack {
            Spacer()
            Text("My name is")
                .font(.title2)
                .fontWeight(.semibold)
            TextField("Please, insert your name here", text: $textFieldText)
                .padding()
                .background(Color.gray.opacity(0.1).cornerRadius(10))
            Spacer()
            Button(
                action: {
                    if textIsAppropriate() {
                        saveText()
                    }
                }, label: {
                    Text("Continue")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textIsAppropriate() ? Color.blue : Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.headline)
                })
            
        }
        .padding()
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count >= 3 {
            return true
        }
        return false
    }
    
    func saveText() {
        textFieldText = ""
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
