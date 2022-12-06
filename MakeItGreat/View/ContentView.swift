import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Home()) {
                    Label("Home", systemImage: "house")
                        .frame(height: 40)
                        .font(.system(size: 22))
                        .fontWeight(.regular)
                }
                .padding(.bottom, 10)
                .padding(.top, 10)
                
                NavigationLink(destination: Profile()) {
                    Label("Profile", systemImage: "person")
                        .frame(height: 40)
                        .font(.system(size: 24))
                        .fontWeight(.regular)
                }
                .padding(.bottom, 10)
                .padding(.top, 10)
                
                NavigationLink(destination: Calendar()) {
                    Label("Calendar", systemImage: "calendar")
                        .frame(height: 40)
                        .font(.system(size: 24))
                        .fontWeight(.regular)
                }
                .padding(.bottom, 10)
                .padding(.top, 10)
                
                NavigationLink(destination: Settings()) {
                    Label("Settings", systemImage: "gearshape")
                        .frame(height: 40)
                        .font(.system(size: 24))
                        .fontWeight(.regular)
                }
                .padding(.bottom, 10)
                .padding(.top, 10)
                
                NavigationLink(destination: Mode()) {
                    Label("Mode", systemImage: "circle.lefthalf.filled")
                        .frame(height: 40)
                        .font(.system(size: 24))
                        .fontWeight(.regular)
                }
                .padding(.bottom, 10)
                .padding(.top, 10)
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
