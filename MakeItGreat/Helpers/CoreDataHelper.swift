import Foundation
import CoreData

class CoreDataHelper {
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataHelper()
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    func getActivityById(id: NSManagedObjectID) -> Activity? {
        do {
            return try viewContext.existingObject(with: id) as? Activity
        } catch {
            return nil
        }
    }
    func deleteActivity(activity: Activity) {
        viewContext.delete(activity)
        save()
    }
    func getAllActivities() -> [Activity] {
        let request: NSFetchRequest<Activity> = Activity.fetchRequest()
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    func save() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
//    func saveActivities(_ activities: [Activity]) {
//        for activity in activities {
//            let newActivity = NSEntityDescription.insertNewObject(forEntityName: "Activity", into: viewContext)
//            newActivity.setValue(activity.name, forKey: "name")
//            newActivity.setValue(activity.category, forKey: "category")
//            newActivity.setValue(activity.doingAt, forKey: "doingAt")
//            newActivity.setValue(activity.finishHour, forKey: "finishHour")
//            newActivity.setValue(activity.startHour, forKey: "startHour")
//        }
//        do {
//            try viewContext.save()
//            print("Success")
//        } catch {
//            print("Error saving: \(error)")
//        }
//    }
    private init() {
        persistentContainer = NSPersistentContainer(name: "Activities")
        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error)")
            }
        }
    }
}
