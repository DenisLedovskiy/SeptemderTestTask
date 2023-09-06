import Foundation

typealias FactResponse = [FactResponseElement]

// MARK: - FactResponseElement
struct FactResponseElement: Codable {
    let fact: String
}
