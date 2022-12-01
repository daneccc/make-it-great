import SwiftUI

struct MainSplitView: View {

    @State private var selectedOptionID: OptionsModel.ID?
    private var optionsVM = OptionsViewModel()

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
                if board.first?.name == "Board" {
                    ContentView()
                } else {
                    SettingsView()
                }
            }
        }
        .onAppear {
            selectedOptionID = optionsVM.options.first?.id
        }
    }
}
