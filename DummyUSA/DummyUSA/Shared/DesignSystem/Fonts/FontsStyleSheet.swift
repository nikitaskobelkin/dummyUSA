import SwiftUI

extension Font {
    /// 24
    static let headingL: Font = .system(size: .fontL, weight: .medium)
    /// 16
    static let headingS: Font = .system(size: .fontS, weight: .semibold)

    /// 16
    static let bodyL: Font = .system(size: .fontS)
    /// 14
    static let body: Font = .system(size: .fontXs)
    /// 12
    static let bodyS: Font = .system(size: .fontXxs)
}

fileprivate extension CGFloat {
    /// 12
    static let fontXxs: CGFloat = 12
    /// 14
    static let fontXs: CGFloat = 14
    /// 16
    static let fontS: CGFloat = 16
    /// 20
    static let fontM: CGFloat = 20
    /// 24
    static let fontL: CGFloat = 24
}
