// MARK: - Network Status Code

/// A struct representing common HTTP status codes for network responses.
enum NetworkStatusCode {
    /// Range of success HTTP status codes (200 to 299).
    static let successCodes: Range<Int> = 200..<300

    /// HTTP status code for a bad request (400).
    static let badRequest: Int = 400

    /// HTTP status code for unauthorized access (401).
    static let unauthorizeCode: Int = 401

    /// HTTP status code for forbidden access (403).
    static let forbidden: Int = 403

    /// HTTP status code for a resource not found (404).
    static let notFoundCode: Int = 404

    /// HTTP status code for unprocessable entity (422).
    static let invalidContent: Int = 422

    /// HTTP status code for internal server error (500).
    static let internalServerErrorCode: Int = 500

    /// HTTP status code for a bad gateway error (502).
    static let badGatewayCode: Int = 502

    /// HTTP status code for service unavailable (503).
    static let serviceUnavailableCode: Int = 503

    /// HTTP status code for authentication-required error (511).
    static let authRequiredCodes: Int = 511
}
