import Foundation

protocol NetworkServiceProtocol {
    func data<T: NetworkingRequest>(_ request: T) async throws -> Data?
    func json<T: NetworkingRequest>(_ request: T) async throws -> T.ResponseType
}
