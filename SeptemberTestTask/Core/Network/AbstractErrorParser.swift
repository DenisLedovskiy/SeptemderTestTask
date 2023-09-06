import Foundation

protocol AbstractErrorParser {

    func parse(statusCode: Int) -> APIError
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
