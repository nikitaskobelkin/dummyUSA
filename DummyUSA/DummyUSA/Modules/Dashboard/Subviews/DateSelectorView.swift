import SwiftUI

struct DateSelectorView: View {
    @Binding var selectedYear: DataYear

    var body: some View {
        HStack(spacing: .space050) {
            Text("\(Localization.periodTitle.localized): ")
            Picker("", selection: $selectedYear) {
                Text(Localization.allTimeLabel.localized)
                    .tag(DataYear.allTime)
                Text(Localization.latestLabel.localized)
                    .tag(DataYear.latest)
                Divider()
                ForEach(DashboardConstants.yearsRange, id: \.self) {
                    Text(String($0))
                        .tag(DataYear.default($0))
                }
            }
            .labelsHidden()
            .pickerStyle(.menu)
        }
    }
}
