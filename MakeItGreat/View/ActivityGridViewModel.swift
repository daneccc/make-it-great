import Foundation

class ActivityGridViewModel: ObservableObject {
    @Published var activities: [ActivityGridModel]

    init() {
        self.activities = [
            ActivityGridModel(),
            ActivityGridModel(),
            ActivityGridModel(),
            ActivityGridModel(),
            ActivityGridModel(),
            ActivityGridModel()
        ]
    }
}
