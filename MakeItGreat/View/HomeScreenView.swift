import SwiftUI

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 260)
            .frame(maxWidth: .infinity)
            .background(Theme.action)
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .font(.system(size: 34.0, weight: .heavy, design: .rounded))
            .foregroundColor(Theme.secondary)
            .tracking(2)
    }
}

struct GrowingButtonSecondary: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 260)
            .frame(maxWidth: .infinity)
            .background(Theme.secondaryTransparent)
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .font(.system(size: 38.0, weight: .heavy, design: .rounded))
            .foregroundColor(Theme.action)
            .tracking(2)
    }
}

struct HomeScreenView: View {
    @StateObject private var activityListVM = ActivityListViewModel()
    @State var randomName: String = ""
    @State var randomName2: String = ""
    @State var doingActivity: Bool = false
    var body: some View {
        if doingActivity == false {
            VStack {
                Spacer()
                HStack {
                    Text("Olá,")
                        .font(.system(size: 45.0, weight: .heavy, design: .rounded))
                        .foregroundColor(Theme.font)
                        .tracking(2)
                        .padding(.bottom)
                    Text("\(UserDefaults.standard.getChildName() ?? "Unset").")      .font(.system(size: 45.0, weight: .heavy, design: .rounded))
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
                        Button("\(randomName)") {
                            doingActivity.toggle()
                            getRandom()
                        }
                        .buttonStyle(GrowingButton())
                    }
                    .padding(.horizontal)
                    VStack {
                        Button("\(randomName2)") {
                            doingActivity.toggle()
                            getRandom2()
                        }
                        .buttonStyle(GrowingButton())
                    }
                    .padding(.horizontal)
                }
                Spacer()
                Spacer()
            }
            .onAppear(perform: {
                activityListVM.getAllActivities()
                getRandom()
                getRandom2()
            })
        }
        if doingActivity == true {
            VStack {
                Spacer()
                HStack {
                    Text("Ok,")
                        .font(.system(size: 45.0, weight: .heavy, design: .rounded))
                        .foregroundColor(Theme.font)
                        .tracking(2)
                        .padding(.bottom)
                    Text("\(UserDefaults.standard.getChildName() ?? "Unset")!")      .font(.system(size: 45.0, weight: .heavy, design: .rounded))
                        .foregroundColor(Theme.tertiary)
                        .tracking(2)
                        .padding(.bottom)
                }
                Text("Me avise quando terminar!")
                    .font(.system(size: 32.0, weight: .heavy, design: .rounded))
                    .foregroundColor(Theme.font)
                    .tracking(2)
                    .padding(.bottom, 50)
                HStack {
                    VStack {
                        Button("Terminar Atividade") {
                            doingActivity.toggle()                        }
                        .buttonStyle(GrowingButtonSecondary())
                    }
                    .padding(.horizontal, 120)

                }
                Spacer()
                Spacer()
            }
        }
    }
    func getRandom() {
        randomName = activityListVM.activities.randomElement()?.name ?? ""
    }
    func getRandom2() {
        randomName2 = activityListVM.activities.randomElement()?.name ?? ""
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
