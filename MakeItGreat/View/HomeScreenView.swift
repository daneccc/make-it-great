import SwiftUI

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(140)
            .background(Theme.action)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct HomeScreenView: View {
    @State var name: String = ""
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Olá,")
                    .font(.system(size: 45.0, weight: .heavy, design: .rounded))
                    .foregroundColor(Theme.font)
                    .tracking(2)
                    .padding(.bottom)
                Text("\(name)")
                    .font(.system(size: 45.0, weight: .heavy, design: .rounded))
                    .foregroundColor(Theme.tertiary)
                    .tracking(2)
                    .padding(.bottom)
            }
            Text("O que você prefere fazer agora?")
                .font(.system(size: 32.0, weight: .heavy, design: .rounded))
                .foregroundColor(Theme.font)
                .tracking(2)
                .padding(.bottom, 50)
            HStack {
                VStack {
                    Button("Press Me") {
                        print("Button pressed!")
                    }
                    .buttonStyle(GrowingButton())
                    Text("Escovar os Dentes")
                        .font(.system(size: 28.0, weight: .heavy, design: .rounded))
                        .foregroundColor(Theme.font)
                        .tracking(2)
                        .padding(.horizontal)
                }
                .padding(.horizontal)
                VStack {
                    Button("Press Me") {
                        print("Button pressed!")
                    }
                    .buttonStyle(GrowingButton())
                    Text("Tomar café da Manhã")
                        .font(.system(size: 28.0, weight: .heavy, design: .rounded))
                        .foregroundColor(Theme.font)
                        .tracking(2)
                }
            }
            Spacer()
            Spacer()
        }
        .onAppear {
            name = UserDefaults.standard.string(forKey: "Name") ?? ""
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
