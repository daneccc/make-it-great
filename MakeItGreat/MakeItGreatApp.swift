import SwiftUI

@main
struct MakeItGreatApp: App {
    @AppStorage("didLaunchBefore") var didLaunchBefore: Bool = false
    var body: some Scene {
        WindowGroup {
            if !didLaunchBefore {
                OnboardingView()
            } else {
                MainSplitView()
            }
        }
    }
}
