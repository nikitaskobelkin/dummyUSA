import SwiftUI

extension View {
    @ViewBuilder
    func isLoading(_ isLoading: Bool) -> some View {
        if isLoading {
            redacted(reason: .placeholder)
        } else {
            self
        }
    }
}
