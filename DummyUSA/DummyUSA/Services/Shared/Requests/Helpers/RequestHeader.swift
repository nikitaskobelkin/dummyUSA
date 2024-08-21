import Foundation

/// A struct representing the headers for a network request.
struct RequestHeaders: Encodable {
    /// The content type of the request, e.g., "application/json".
    let contentType: RequestContentType?

    /// The accepted response content type, e.g., "application/json".
    let accept: RequestContentType?

    private enum CodingKeys: String, CodingKey {
        case contentType = "Content-Type"
        case accept = "Accept"
    }
}
