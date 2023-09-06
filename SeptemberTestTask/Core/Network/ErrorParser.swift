import Foundation

//enum ErrorParserErrors: Error {
//    case networkError
//}

class ErrorParser: AbstractErrorParser {

    func parse(_ result: Error) -> Error {
        return result
    }

    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
