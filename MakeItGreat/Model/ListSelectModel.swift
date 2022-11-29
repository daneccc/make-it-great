import Foundation

class ListItem: ObservableObject {
    var id: UUID
    var activity: String
    var completion: Bool

    static var listMock = [
        ListItem(id: UUID(), activity: "Run", completion: false),
        ListItem(id: UUID(), activity: "Jump", completion: true),
        ListItem(id: UUID(), activity: "Walk", completion: true)
    ]

    init(id: UUID, activity: String, completion: Bool) {
        self.id = id
        self.activity = activity
        self.completion = completion
    }
}
