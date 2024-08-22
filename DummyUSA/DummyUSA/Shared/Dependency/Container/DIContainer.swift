import Foundation

// Best use Swinject or Own Service Locator

final class DIContainer {
    static let shared = DIContainer()

    private init() {}

    let networkService: NetworkServiceProtocol = NetworkService()
}
