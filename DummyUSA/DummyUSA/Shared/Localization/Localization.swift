import Foundation

enum Localization: String {
    case dashboardTitle
    case populationSubtitle
    case nationLabel
    case stateLabel
    case notFoundTitle
    case periodTitle
    case allTimeLabel
    case latestLabel
    case connectionErrorTitle
    case connectionErrorText
    case retryButton
    case errorTitle
    case serverErrorText
    case byPreffix
}

// MARK: - String value

extension Localization {
    var localized: String {
        NSLocalizedString(rawValue, comment: "")
    }

    func localized(with params: CVarArg...) -> String {
        String(format: localized, params)
    }
}

