import SwiftUI

struct DrilldownsSelectorView: View {
    @Binding var selectedDrilldowns: DataDrilldowns

    var body: some View {
        HStack(spacing: .space050) {
            Text("\(Localization.byPreffix.localized): ")
            Picker("", selection: $selectedDrilldowns) {
                ForEach(DataDrilldowns.allCases, id: \.self) {
                    Text($0.rawValue)
                        .tag($0)
                }
            }
            .labelsHidden()
            .pickerStyle(.menu)
        }
    }
}
