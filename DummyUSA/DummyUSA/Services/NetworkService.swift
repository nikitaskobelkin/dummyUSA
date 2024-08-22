import Foundation
import Alamofire

final class NetworkService: NetworkServiceProtocol {
    private let sessionManager: Session
    private let responseSerializer = BaseDataResponseSerializer()

    init(sessionManager: Session = .default) {
        self.sessionManager = sessionManager
    }

    // MARK: - Instance Methods

    private func createUrlRequest<T: NetworkingRequest>(_ request: T) throws -> URLRequest {
        let requestDescriptor = request.requestDescriptor
        let url = requestDescriptor.baseUrl
            .appendingPathComponent(requestDescriptor.prefix)
            .appendingPathComponent(requestDescriptor.path)
        var urlRequest = try URLRequest(url: url, method: requestDescriptor.method)
        urlRequest = applyAdapter(urlRequest, requestDescriptor: requestDescriptor)
        urlRequest = try requestDescriptor.encoding.encode(urlRequest, with: requestDescriptor.params)
        return urlRequest
    }

    private func applyAdapter(
        _ urlRequest: URLRequest,
        requestDescriptor: RequestDescriptor
    ) -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.allHTTPHeaderFields = requestDescriptor.headers
        return urlRequest
    }

    private var isConnected: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }

    private func performRequest<Serializer: ResponseSerializer, R: NetworkingRequest, T>(
        request: R,
        serializer: Serializer
    ) async throws -> T where T == Serializer.SerializedObject {
        guard isConnected else {
            throw NetworkError.noConnection
        }
        
        guard let request = try? createUrlRequest(request) else {
            throw NetworkError.badRequest
        }

        let result = await sessionManager.request(request)
            .validate(statusCode: NetworkStatusCode.successCodes)
            .serializingResponse(using: serializer)
            .result

        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}

// MARK: - Public API

extension NetworkService {
    func data<T: NetworkingRequest>(_ request: T) async throws -> Data? {
        try await performRequest(request: request, serializer: responseSerializer)
    }

    func json<T: NetworkingRequest>(_ request: T) async throws -> T.ResponseType {
        do {
            guard let data = try await data(request) else {
                throw NetworkError.invalidContent
            }
            let object = try JSONDecoder().decode(T.ResponseType.self, from: data)
            return object
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.invalidJSON
        }
    }
}
