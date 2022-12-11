import SwiftUI

struct ContentView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationStack{
            VStack {
                Image("Bemvindo")
                    .padding(.top, 50)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AgeRegister()) {
                        Text("Próximo")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 20)
                }
            }
            .padding(.top, 50)
            VStack {
                Text("Meu nome é")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(Color("textcolor"))
                    .padding(.top, 250)
                TextField("", text: $textFieldText) // value: $variavel, formatter: NumberF...
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .font(.system(size: 20, design: .rounded))
                    .padding(.top, 40)
                Divider()
                    .frame(maxWidth: 458, minHeight: 3)
                    .overlay(Color.blue)
                Spacer()
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
