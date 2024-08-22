import SwiftUI

struct PopulationDetailsView: View {
    private enum Constants {
        static let slugBackgroundOpacity: CGFloat = 0.08
    }

    var year: Int?
    let data: PopulationDataModel.PopulationValueModel

    var body: some View {
        VStack(alignment: .leading, spacing: .space200) {
            HStack(spacing: .space100) {
                Text("\(Localization.populationSubtitle.localized):")
                    .font(.headingS)
                    .foregroundStyle(Color.Text.default)
                Text("\(data.population)")
                    .font(.body)
                    .foregroundStyle(Color.Text.subtle)
                Spacer()
            }
            if let slug = data.slug {
                Text(slug)
                    .foregroundStyle(Color.Accent.red)
                    .padding(.space050)
                    .background(Color.Accent.red.opacity(Constants.slugBackgroundOpacity))
                    .clipShape(RoundedRectangle(cornerRadius: .space050))
            }
            Spacer()
        }
        .padding(.all, .space300)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension PopulationDetailsView {
    var title: String {
        guard let year else { return data.origin }
        return "\(data.origin) (\(String(year)))"
    }
}
