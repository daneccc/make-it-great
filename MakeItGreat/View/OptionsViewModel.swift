import Foundation

class OptionsViewModel: ObservableObject {
    @Published var options: [OptionsModel]

    init() {
        self.options = [
            OptionsModel(name: "Board", image: "lasso"),
            OptionsModel(name: "Statistics", image: "scribble"),
            OptionsModel(name: "Settings", image: "paperplane")
        ]
    }
}
