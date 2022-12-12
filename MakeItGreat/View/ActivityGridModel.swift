import Foundation

struct ActivityGridModel: Identifiable {
    var id = UUID()
    var completed: Bool = false
    var name: String = ""
    var category: String = ""
    var doingAt: String = ""
    var startHour: String = ""
    var finishHour: String = ""
}
