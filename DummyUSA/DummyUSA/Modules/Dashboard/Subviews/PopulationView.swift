import SwiftUI

struct PopulationView: View {
    @State private var searchText: String = ""
    let year: Int
    let data: [PopulationDataModel.PopulationValueModel]

    var body: some View {
        List {
            if !records.isEmpty {
                ForEach(records) { record in
                    NavigationLink(destination: {
                        PopulationDetailsView(data: record)
                    }) {
                        HStack(spacing: .space200) {
                            Text(String(record.origin))
                                .font(.bodyL)
                                .foregroundStyle(Color.Text.default)
                            Spacer()
                            Text("\(record.population)")
                                .font(.bodyS)
                                .foregroundStyle(Color.Text.subtle)
                        }
                    }
                    .buttonStyle(.plain)
                }
            } else {
                NotFoundPlaceholderView()
                    .listRowBackground(Color.clear)
            }
        }
        .searchable(text: $searchText)
        .navigationTitle(String(year))
    }
}

private extension PopulationView {
    var records: [PopulationDataModel.PopulationValueModel] {
        guard !searchText.isEmpty else { return data }
        return data.filter({ $0.origin.contains(searchText) })
    }
}
