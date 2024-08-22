import Foundation

final class DashboardDataSource: DashboardDataSourceProtocol {
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func fetchPopulation(
        by drilldowns: DataDrilldowns,
        year: DataYear
    ) async throws -> PopulationResponse {
        try await networkService.json(
            GetPopulationRequest(
                measures: .population,
                drillwdowns: drilldowns,
                year: year
            )
        )
    }
}
