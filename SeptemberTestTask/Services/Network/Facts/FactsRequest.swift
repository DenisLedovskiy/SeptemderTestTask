import Foundation
import Alamofire

class FactsRequest: AbstractRequestFactory {

    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = Network.baseUrl

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}

extension FactsRequest: FactsRequestFactory {
    func getFact(completionHandler: @escaping (Alamofire.AFDataResponse<FactResponse>) -> Void) {
        guard let url = baseUrl else {return}
        let requestModel = FactsStruct(baseUrl: url, encoding: .url, headers: [
            "X-Api-Key" : Network.apiKey,
        ])
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension FactsRequest {

    struct FactsStruct: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "/facts"
        let encoding: RequestRouterEncoding
        let limit = 1
        let headers: HTTPHeaders
        var parameters: Parameters? {
            return [ "limit" : limit ]
        }
    }
}
