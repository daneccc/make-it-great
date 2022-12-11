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
    func getAllActivitys() -> [Activity] {
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
    private init() {
        persistentContainer = NSPersistentContainer(name: "Activities")
        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error)")
            }
        }
    }
}
