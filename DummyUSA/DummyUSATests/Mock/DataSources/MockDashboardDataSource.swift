import Foundation
@testable import DummyUSA

final class MockDashboardDataSource: DashboardDataSourceProtocol {
    private let result: Result<PopulationResponse, NetworkError>?

    init(result: Result<PopulationResponse, NetworkError>? = nil) {
        self.result = result
    }

    func fetchPopulation(by drilldowns: DataDrilldowns, year: DataYear) async throws -> PopulationResponse {
        if let result = result {
            switch result {
            case .success(let response):
                return response
            case .failure(let error):
                throw error
            }
        }
        
        // Return an empty response by default if not set
        return PopulationResponse(data: [], source: [])
    }
}
