import SwiftUI

struct BackgroundView: View {

    @State var presentOnboarding: Bool = true

    @State var presentMainView: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                Image("Bemvindo")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(x: 0.7, y: 0.7)
                    .padding(.top, 30)
            }
        }
        .onAppear {
            if UserDefaults.standard.string(forKey: "Name") != "" {
                presentOnboarding = false
                presentMainView = true
            } else {
                presentOnboarding = true
                presentMainView = false
            }
        }
        .fullScreenCover(isPresented: $presentOnboarding) {
            OnboardingView()
        }
        .fullScreenCover(isPresented: $presentMainView) {
            MainSplitView()
        }
    }
}
