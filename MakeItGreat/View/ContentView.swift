import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Home()) {
                    Label("Home", systemImage: "house")
                }
                NavigationLink(destination: Profile()) {
                    Label("Profile", systemImage: "person")
                }
                NavigationLink(destination: Calendar()) {
                    Label("Calendar", systemImage: "calendar")
                }
                NavigationLink(destination: Settings()) {
                    Label("Settings", systemImage: "gearshape")
                }
                NavigationLink(destination: Mode()) {
                    Label("Mode", systemImage: "circle.lefthalf.filled")
                }
            }
            .navigationTitle("Hello User")
            Home()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
