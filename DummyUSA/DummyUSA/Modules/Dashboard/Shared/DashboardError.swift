import Foundation

enum DashboardError {
    case connection
    case server
}

extension DashboardError {
    var title: Localization {
        switch self {
        case .connection: .connectionErrorTitle
        case .server: .errorTitle
        }
    }

    var text: Localization {
        switch self {
        case .connection: .connectionErrorText
        case .server: .serverErrorText
        }
    }
}
