import SwiftUI

struct OnboardingView: View {

    @State var textFieldText: String = (UserDefaults.standard.string(forKey: "Name") ?? "")

    var body: some View {

        NavigationStack {
            VStack {
                Image("Bemvindo")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(x: 0.7, y: 0.7)
                    .padding(.top, 30)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AgeRegister()) {
                        Text("Próximo")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                    }
                    .disabled(textFieldText.isEmpty)
                    .padding(.trailing, 20)
                    .padding(.top, 20)
                }
            }
            .padding(.top, 50)
            VStack {
                Text("Meu nome é")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(Theme.font)
                    .padding(.top, 100)
                TextField("", text: $textFieldText) // value: $variavel, formatter: NumberF...
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .padding(.top, 25)
                Divider()
                    .frame(maxWidth: 458, minHeight: 3)
                    .overlay(Color.blue)
                Spacer()
            }
            .onChange(of: textFieldText) { _ in
                UserDefaults.standard.set(textFieldText, forKey: "Name")
            }
            .onAppear {
                print("\(textFieldText)")
            }
        }

    }

}

struct AgeRegister: View {

    @Environment(\.dismiss) var dismiss

    @State var age = UserDefaults.standard.integer(forKey: "Age")

    @State var flag = false

    @State var origin = false

    var body: some View {
        NavigationStack {
            VStack {
                Image("Bemvindo")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(x: 0.7, y: 0.7)
                    .padding(.top, 30)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Voltar", action: {
                        dismiss()
                    })
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .padding(.trailing, 20)
                        .padding(.top, 20)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        MorningGridView(flag: $flag, origin: $origin)
                    } label: {
                        Text("Próximo")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .padding(.trailing, 20)
                            .padding(.top, 20)
                    }
                    .disabled(age <= 0)
                }
            }
            .padding(.top, 50)
            VStack {
                Text("Minha idade é")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(Theme.font)
                    .padding(.top, 100)
                TextField("", value: $age, format: .number)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .font(.system(size: 20, design: .rounded))
                    .padding(.top, 40)
                Divider()
                    .frame(maxWidth: 458, minHeight: 3)
                    .overlay(Color.blue)
                Spacer()
            }
            .onChange(of: age) { _ in
                UserDefaults.standard.set(age, forKey: "Age")
            }
        }

    }

}
