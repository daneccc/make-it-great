import Foundation
import CoreData

class ActivityListViewModel: ObservableObject {
    var name: String = ""
    var doingAt: String = ""
    var category: String = ""
    var finishHour: String = ""
    var startHour: String = ""

    @Published var activitys: [ActivityViewModel] = []
    func getAllActivitys() {
        activitys = CoreDataHelper.shared.getAllActivitys().map(ActivityViewModel.init)
    }
    func delete(_ activity: ActivityViewModel) {
        let existingActivity = CoreDataHelper.shared.getActivityById(id: activity.id)
        if let existingActivity = existingActivity {
            CoreDataHelper.shared.deleteActivity(activity: existingActivity)
        }
    }
    func save() {
        let activity = Activity(context: CoreDataHelper.shared.viewContext)
        activity.name = name
        activity.doingAt = doingAt
        activity.category = category
        activity.finishHour = finishHour
        activity.startHour = startHour
        CoreDataHelper.shared.save()
    }
}

struct ActivityViewModel {
    let activity: Activity
    var id: NSManagedObjectID {
        return activity.objectID
    }
    var name: String {
        return activity.name ?? ""
    }
    var doingAt: String {
        return activity.doingAt ?? ""
    }
    var category: String {
        return activity.category ?? ""
    }
    var startHour: String {
        return activity.startHour ?? ""
    }
    var finishHour: String {
        return activity.finishHour ?? ""
    }
}
