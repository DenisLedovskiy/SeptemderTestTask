import Foundation
import CoreData

enum ResultCoreData {
    case success, fail(Error)
}

extension NSManagedObjectContext {

    // MARK: - Load data

    var dataSource: TextMODataSource { return TextMODataSource(context: self) }

    // MARK: - Data manupulation

    func add(_ text: String, completion: ((ResultCoreData) -> ())?) {
        perform {
            let entity: TextMO = TextMO(context: self)
            entity.text = text
            self.save(completion: completion)
        }
    }

    func save(completion: ((ResultCoreData) -> ())?) {
        do {
            try self.save()
            completion?(.success)
        } catch let error {
            self.rollback()
            completion?(.fail(error))
        }
    }
}
