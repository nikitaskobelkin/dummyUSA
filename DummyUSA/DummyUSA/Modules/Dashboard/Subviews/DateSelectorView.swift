import SwiftUI

struct DateSelectorView: View {
    @Binding var selectedYear: DataYear

    var body: some View {
        HStack(spacing: .space050) {
            Text("Period: ")
            Picker("", selection: $selectedYear) {
                Text("All time")
                    .tag(DataYear.allTime)
                Text("Latest")
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
