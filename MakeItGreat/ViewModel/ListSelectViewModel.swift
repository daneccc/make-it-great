import Foundation

class ListSelectViewModel: ObservableObject {
    @Published var listItems: [ListItem]

    init() {
        self.listItems = ListItem.listMock
    }
}
