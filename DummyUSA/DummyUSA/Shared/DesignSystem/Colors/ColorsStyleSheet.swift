import SwiftUI

extension Color {
    enum Text {
        static let `default`: Color = Color(.Colors.Text.default)
        static let subtle: Color = .init(.Colors.Text.subtle)
    }

    enum Background {
        static let brand: Color = .init(.Colors.Background.brand)
        static let neutral: Color = .init(.Colors.Background.neutral)
        static let neutral0: Color = .init(.Colors.Background.neutral0)
    }

    enum Accent {
        static let red: Color = .init(.Colors.Accent.red)
    }
}
