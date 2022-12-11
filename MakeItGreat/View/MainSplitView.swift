import SwiftUI

struct MainSplitView: View {

    @State private var selectedOptionID: OptionsModel.ID?
    private var optionsVM = OptionsViewModel()
    @State var flag: Bool = true

    var body: some View {
        NavigationSplitView {
            List(optionsVM.options, selection: $selectedOptionID) { option in
                HStack {
                    Image(systemName: option.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("\(option.name)")
                        .font(.system(.title3, design: .rounded))
                        .bold()
                }
            }
            .navigationTitle("Person Name")
        } detail: {
            if let selectedOptionID, let board = optionsVM.options.filter({ $0.id == selectedOptionID }) {
                switch board.first?.name {
                case "Board":
                    HomeScreenView()
                case "Settings":
                    SettingsView(flag: $flag)
                case "History":
                    RegisterNameView()
                default:
                    ContentView()
                }
            }
        }
        .accentColor(Theme.action)
        .onChange(of: selectedOptionID, perform: { _ in
            let board = optionsVM.options.filter({ $0.id == selectedOptionID })
            if board.first?.name != "Settings" {
                flag.toggle()
            }
        })
        .onAppear {
            selectedOptionID = optionsVM.options.first?.id
        }
    }
}
