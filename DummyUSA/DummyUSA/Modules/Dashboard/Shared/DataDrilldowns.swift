import Foundation

enum DataDrilldowns: String, Encodable, CaseIterable {
    case nation = "Nation"
    case state = "State"

    var label: Localization {
        switch self {
        case .nation: .nationLabel
        case .state: .stateLabel
        }
    }
}
