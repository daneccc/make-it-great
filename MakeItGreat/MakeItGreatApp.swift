import SwiftUI

@main
struct MakeItGreatApp: App {
    var body: some Scene {
        WindowGroup {
            MotherView().environmentObject(ViewRouter())
        }
    }
}
