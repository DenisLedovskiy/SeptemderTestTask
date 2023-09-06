import Foundation
import Alamofire

protocol AbstractRequestFactory {

    var errorParser: AbstractErrorParser { get }
    var sessionManager: Session { get }
    var queue: DispatchQueue { get }
    @discardableResult
    func request<T: Decodable>(
        request: URLRequestConvertible,
        completionHandler: @escaping (AFDataResponse<T>) -> Void) -> DataRequest
}

extension AbstractRequestFactory {

    @discardableResult
    public func request<T: Decodable>(
        request: URLRequestConvertible,
        completionHandler: @escaping (AFDataResponse<T>) -> Void) -> DataRequest {
            return sessionManager
                .request(request)
                .responseCodable(errorParser: errorParser, queue: queue, completionHandler: completionHandler)
        }

    @discardableResult
    public func requestString(
        request: URLRequestConvertible,
        completionHandler: @escaping (String) -> Void) -> DataRequest {
            return sessionManager
                .request(request)
                .responseString(completionHandler: { string in
                    print(string)
                    print(string.result)
                })
        }
}
