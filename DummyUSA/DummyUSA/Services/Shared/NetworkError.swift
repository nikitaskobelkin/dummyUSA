import Alamofire

// MARK: - Network Error

/// An enumeration representing various network-related errors.
enum NetworkError: Error {
    /// Indicates an unauthorized access error.
    case unauthorized

    /// Indicates an error related to invalid JSON.
    case invalidJSON

    /// Indicates an error originating from Alamofire.
    case alamofireError(error: AFError)

    /// Indicates an unspecified invalid error.
    case invalidError

    /// Indicates a bad request error.
    case badRequest

    /// Indicates a forbidden access error.
    case forbidden

    /// Indicates a resource not found error.
    case notFound

    /// Indicates an internal server error.
    case internalServerError

    /// Indicates a bad gateway error.
    case badGateway

    /// Indicates an authentication-required error.
    case authRequired

    /// Indicates a no connection error.
    case noConnection

    /// Indicates a service unavailable error.
    case serviceUnavailable

    /// Indicates unprocessable content.
    case invalidContent
}
