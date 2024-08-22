import Foundation

protocol DashboardDataSourceProtocol {
    func fetchPopulation(
        by drilldowns: DataDrilldowns,
        year: DataYear
    ) async throws -> PopulationResponse
}
