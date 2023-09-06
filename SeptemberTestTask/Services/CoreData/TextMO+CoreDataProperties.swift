import Foundation
import CoreData


extension TextMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TextMO> {
        return NSFetchRequest<TextMO>(entityName: "TextMO")
    }

    @NSManaged public var text: String?

    public var wrappedText: String {
        text ?? ""
    }
}

extension TextMO : Identifiable {

}
