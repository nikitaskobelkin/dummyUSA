import Foundation

private struct DashboardDataSourceKey: InjectionKey {
    static var currentValue: DashboardDataSourceProtocol = DashboardDataSource(
        networkService: DIContainer.shared.networkService
    )
}

extension InjectedValues {
    var dashboardDataSource: DashboardDataSourceProtocol {
        get { Self[DashboardDataSourceKey.self] }
        set { Self[DashboardDataSourceKey.self] = newValue }
    }
}
