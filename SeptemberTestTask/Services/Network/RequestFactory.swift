import Foundation
import Alamofire

class RequestFactory {

    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }

    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()

    let sessionQueue = DispatchQueue.global(qos: .utility)

    func makeFactsFatory() -> FactsRequestFactory {
        let errorParser = makeErrorParser()
        return FactsRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
