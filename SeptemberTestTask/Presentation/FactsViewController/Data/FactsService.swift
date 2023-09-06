import Foundation
import UIKit

final class FactsService {
    static let shared = FactsService()

    private let requestFactory = RequestFactory()

    public func requestFact(completion: @escaping (Result<FactResponse, APIError>) -> Void) {
        let fact = requestFactory.makeFactsFatory()
        fact.getFact {
            response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                if let customError = error.underlyingError as? APIError {
                    completion(.failure(customError))
                } else {
                    print(error)
                }
            }
        }
    }
}
