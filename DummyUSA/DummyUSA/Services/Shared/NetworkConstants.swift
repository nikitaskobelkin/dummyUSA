import Foundation

enum NetworkConstants {
    static let defaultTimeInterval: Int = 8

    enum Environment {
        case production
    }

    enum Endpoint: String {
        case data
    }
}

extension NetworkConstants.Environment {
    private var urlScheme: String { "https" }

    private var domain: String {
        switch self {
        case .production:
            return "datausa.io"
        }
    }

    var baseURL: URL {
        var url = URLComponents()
        url.scheme = urlScheme
        url.host = domain
        url.path = "/api"
        precondition(url.url != nil, "Invalid URL: \(url)")
        return url.url!
    }
}
