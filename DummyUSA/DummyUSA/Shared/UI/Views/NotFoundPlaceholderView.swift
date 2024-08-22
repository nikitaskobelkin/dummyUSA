import SwiftUI

struct NotFoundPlaceholderView: View {
    var body: some View {
        VStack(spacing: .space300) {
            Spacer()
            VStack(spacing: .space100) {
                Text(Localization.notFoundTitle.localized)
                    .font(.headingL)
                    .foregroundStyle(Color.Text.default)
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
