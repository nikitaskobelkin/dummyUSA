import SwiftUI

// MARK: - Primary button style

public extension ButtonStyle where Self == PrimaryButton {
    static var primary: PrimaryButton {
        PrimaryButton()
    }
}

/// A custom button style for primary buttons.
public struct PrimaryButton: ButtonStyle {
    private let minWidth: CGFloat = .large * 10
    private let padding: CGFloat = .space200
    private let scaleEffect: CGFloat = 0.96
    private let isFullWidth: Bool
    private let isDisabled: Bool

    /// Initializes the PrimaryButton style.
    ///
    /// - Parameters:
    ///   - isFullWidth: A flag indicating whether the button should be full width.
    ///   - isDisabled: A flag indicating whether the button is disabled.
    public init(
        isFullWidth: Bool = true,
        isDisabled: Bool = false
    ) {
        self.isFullWidth = isFullWidth
        self.isDisabled = isDisabled
    }

    /// Creates the visual appearance of the primary button.
    ///
    /// - Parameter configuration: The button's configuration.
    /// - Returns: A view representing the primary button's appearance.
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, padding)
            .frame(minWidth: minWidth, maxWidth: isFullWidth ? .infinity : nil)
            .background(Color.Background.brand)
            .foregroundColor(.white)
            .cornerRadius(.xsmall)
            .font(.bodyL)
            .scaleEffect(configuration.isPressed && !isDisabled ? scaleEffect : 1)
            .disabled(isDisabled)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}
