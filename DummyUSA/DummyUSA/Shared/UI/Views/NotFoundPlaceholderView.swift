import SwiftUI

struct NotFoundPlaceholderView: View {
    let title: String
    var subtitle: String?

    var body: some View {
        VStack(spacing: .space300) {
            Spacer()
            VStack(spacing: .space100) {
                Text(title)
                    .font(.headingL)
                    .foregroundStyle(Color.Text.default)
                if let subtitle {
                    Text(subtitle)
                        .font(.body)
                        .foregroundStyle(Color.Text.subtle)
                }
            }
            ImageRatio(
                image: .Placeholder.americanPerson,
                width: .medium * 10
            )
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}
