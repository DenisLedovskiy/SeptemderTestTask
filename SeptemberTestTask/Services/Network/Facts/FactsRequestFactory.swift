import Foundation
import Alamofire

protocol FactsRequestFactory {

    func getFact(completionHandler: @escaping (AFDataResponse<FactResponse>) -> Void)
}
