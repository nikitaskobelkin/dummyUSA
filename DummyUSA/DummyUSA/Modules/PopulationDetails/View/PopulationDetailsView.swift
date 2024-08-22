import SwiftUI

struct PopulationDetailsView: View {
    let data: PopulationDataModel.PopulationValueModel

    var body: some View {
        VStack(alignment: .leading, spacing: .space200) {
            HStack(spacing: .space100) {
                Text("Population:")
                    .font(.headingS)
                    .foregroundStyle(Color.Text.default)
                Text("\(data.population)")
                    .font(.body)
                    .foregroundStyle(Color.Text.subtle)
                Spacer()
            }
            if let slug = data.slug {
                Text(slug)
                    .foregroundStyle(.white)
                    .padding(.space050)
                    .background(Color.Accent.red)
                    .clipShape(RoundedRectangle(cornerRadius: .space050))
            }
            Spacer()
        }
        .padding(.all, .space300)
        .navigationTitle(data.origin)
        .navigationBarTitleDisplayMode(.inline)
    }
}
