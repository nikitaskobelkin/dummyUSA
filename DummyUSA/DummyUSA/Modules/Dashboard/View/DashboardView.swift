import SwiftUI
import Combine

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()
    @State private var navigationPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                if let error = viewModel.fetchingError, !viewModel.isLoading {
                    ErrorPlaceholderView(
                        title: error.title,
                        subtitle: error.text,
                        retry: viewModel.fetch
                    )
                } else if viewModel.data.isEmpty, !viewModel.isLoading {
                    NotFoundPlaceholderView()
                } else {
                    // No need here lazy loading, because API without paggination and data not heavy for this
                    List(viewModel.data, id: \.self) { group in
                        NavigationLink(destination: {
                            if group.isSingleValue, let record = group.value.first {
                                PopulationDetailsView(year: group.year, data: record)
                            } else {
                                PopulationView(year: group.year, data: group.value)
                            }
                        }) {
                            HStack(spacing: .space200) {
                                Text(String(group.year))
                                    .font(.bodyL)
                                    .foregroundStyle(Color.Text.default)
                                Spacer()
                                Text(group.groupPreview)
                                    .font(.bodyS)
                                    .foregroundStyle(Color.Text.subtle)
                            }
                        }
                        .buttonStyle(.plain)
                    }
                    .isLoading(viewModel.isLoading)
                    .disabled(viewModel.isLoading)
                }
            }
            .navigationTitle(Localization.dashboardTitle.localized)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    DateSelectorView(
                        selectedYear: $viewModel.year
                    )
                }

                ToolbarItem(placement: .topBarTrailing) {
                    DrilldownsSelectorView(
                        selectedDrilldowns: $viewModel.drilldowns
                    )
                }
            }
            .onChange(of: viewModel.drilldowns) {
                viewModel.fetch()
            }
            .onChange(of: viewModel.year) {
                viewModel.fetch()
            }
            .refreshable {
                viewModel.fetch()
            }
            .onAppear {
                viewModel.fetch()
            }
        }
        .background(Color.Background.neutral0)
    }
}
