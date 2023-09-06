import Foundation

struct APIError: Codable, Error {
    var errorMessage: String?
}

class ErrorParser: AbstractErrorParser {

    func parse(statusCode: Int) -> APIError {
        return APIError(errorMessage: setErrorMessage(statusCode))
    }

    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}

extension ErrorParser {

    private func setErrorMessage(_ errorCode: Int) -> String {

        switch errorCode {
        case 400...499:
            return "Client error responses. Check API Key."
        case 500...599:
            return "Server error"
        default:
            return "Network error. Check your Internet connection."
        }
    }
}
