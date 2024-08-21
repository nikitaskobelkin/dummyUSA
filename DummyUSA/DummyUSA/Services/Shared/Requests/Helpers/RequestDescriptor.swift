import Foundation
import Alamofire

struct RequestDescriptor {
    let baseUrl: URL
    let prefix: String
    let path: String
    let method: HTTPMethod
    let headers: [String: String]
    let params: Parameters
    let encoding: ParameterEncoding
    let timeoutInterval: Int

    init(
        baseUrl: URL,
        prefix: String = "",
        path: String = "",
        method: HTTPMethod,
        headers: [String: String] = [:],
        params: Parameters = [:],
        encoding: ParameterEncoding,
        timeoutInterval: Int = NetworkConstants.defaultTimeInterval
    ) {
        self.baseUrl = baseUrl
        self.prefix = prefix
        self.path = path
        self.method = method
        self.headers = headers
        self.params = params
        self.encoding = encoding
        self.timeoutInterval = timeoutInterval
    }
}
