import CoreData

class TextMODataSource {

    let controller: NSFetchedResultsController<NSFetchRequestResult>
    let request: NSFetchRequest<NSFetchRequestResult> = TextMO.fetchRequest()

    let defaultSort: NSSortDescriptor = NSSortDescriptor(key: #keyPath(TextMO.text), ascending: true)

    init(context: NSManagedObjectContext, sortDescriptors: [NSSortDescriptor] = []) {
        var sort: [NSSortDescriptor] = sortDescriptors
        if sort.isEmpty { sort = [defaultSort] }

        request.sortDescriptors = sort

        controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
    }

    // MARK: - DataSource APIs

    var count: Int { return controller.fetchedObjects?.count ?? 0 }

    func fetch(completion: ((ResultCoreData) -> ())?) {
        do {
            try controller.performFetch()
            completion?(.success)
        } catch let error {
            completion?(.fail(error))
        }
    }

    func getItem(at indexPath: IndexPath) -> String {
        let data: TextMO = controller.object(at: indexPath) as! TextMO
        return data.wrappedText
    }

    func getAllItems() -> [String] {
        var newArray = [String]()
        controller.fetchedObjects?.forEach({
            let item = $0 as! TextMO
            newArray.append(item.wrappedText)
        })
        return newArray
    }
}
