import SwiftUI

struct ErrorPlaceholderView: View {
    let title: Localization
    var subtitle: Localization?
    var retry: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: .space300) {
            Spacer()
            VStack(spacing: .space100) {
                Text(title.localized)
                    .font(.headingL)
                    .foregroundStyle(Color.Text.default)
                if let subtitle {
                    Text(subtitle.localized)
                        .font(.body)
                        .foregroundStyle(Color.Text.subtle)
                        .multilineTextAlignment(.center)
                }
                Button(Localization.retryButton.localized) {
                    retry?()
                }
            }
            ImageRatio(
                image: .Placeholder.americanPerson,
                width: .medium * 10
            )
            Spacer()
        }
    }
}
