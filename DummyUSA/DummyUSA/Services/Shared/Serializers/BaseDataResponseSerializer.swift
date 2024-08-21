import Foundation
import Alamofire

// MARK: - Base Data Response Serializer

/// A response serializer for handling data responses.
final class BaseDataResponseSerializer: ResponseSerializer {

    /// Serializes the data response.
    /// - Parameters:
    ///   - request: The URL request.
    ///   - response: The HTTP URL response.
    ///   - data: The response data.
    ///   - error: The error that occurred during the request.
    /// - Returns: The serialized data.
    /// - Throws: An error if serialization fails.
    func serialize(
        request: URLRequest?,
        response: HTTPURLResponse?,
        data: Data?,
        error: Error?
    ) throws -> Data? {

        // Extract the HTTP status code from the response or default to 0.
        let statusCode = response?.statusCode ?? 0

        // Check if the status code is in the range of successful response codes and the data is not empty.
        if NetworkStatusCode.successCodes.contains(statusCode) {
            if let data = data, !data.isEmpty {
                // Preprocess the data using the data preprocessor.
                return try dataPreprocessor.preprocess(data)
            } else {
                return nil
            }
        }

        // Handle various status codes and throw corresponding errors.
        switch statusCode {
        case NetworkStatusCode.badRequest:
            throw NetworkError.badRequest
        case NetworkStatusCode.unauthorizeCode:
            throw NetworkError.unauthorized
        case NetworkStatusCode.forbidden:
            throw NetworkError.forbidden
        case NetworkStatusCode.notFoundCode:
            throw NetworkError.notFound
        case NetworkStatusCode.internalServerErrorCode:
            throw NetworkError.internalServerError
        case NetworkStatusCode.badGatewayCode:
            throw NetworkError.badGateway
        case NetworkStatusCode.serviceUnavailableCode:
            throw NetworkError.serviceUnavailable
        case NetworkStatusCode.authRequiredCodes:
            throw NetworkError.authRequired
        case NetworkStatusCode.invalidContent:
            throw NetworkError.invalidContent
        default:
            throw AFError.responseValidationFailed(reason: .unacceptableStatusCode(code: statusCode))
        }
    }
}
