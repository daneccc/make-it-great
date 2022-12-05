import SwiftUI

struct ContentView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
            VStack {
                Image("Bemvindo")
                    .position(x: 700,y:150)
            }

        VStack {
            Text("Meu nome é")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color("t"))
            TextField("Escreva seu nome aqui", text: $textFieldText)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .font(.system(size: 20, design: .rounded))
                .padding()
            Divider()
            Spacer()
            Button(
                action: {
                    if textIsAppropriate() {
                        saveText()
                    }
                }, label: {
                    Text("Próximo")
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
