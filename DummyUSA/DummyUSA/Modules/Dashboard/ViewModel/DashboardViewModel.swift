import SwiftUI

@MainActor
final class DashboardViewModel: ObservableObject {
    @Published private(set) var data: [PopulationDataModel] = []
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var fetchingError: DashboardError?
    @Published var year: DataYear = .latest
    @Published var drilldowns: DataDrilldowns = .nation

    @Dependency(\.dashboardDataSource) private var dataSource

    init() {}

    func fetch() {
        fetchingError = nil
        isLoading = true
        Task { // No need here @MainActor, @MainActor of the class will be handle updates on main
            defer { isLoading = false }
            
            do {
                let response = try await dataSource.fetchPopulation(by: drilldowns, year: year)
                let groupedByYear = Dictionary(grouping: response.data) { $0.idYear }
                data = groupedByYear.compactMap { year, data in
                    guard let year else { return nil }
                    return PopulationDataModel(year: year, data: data)
                }
                .sorted(by: { $0.year > $1.year })
            } catch let error as NetworkError {
                switch error {
                case .noConnection:
                    fetchingError = .connection
                default:
                    fetchingError = .server
                }
            }
        }
    }
}
