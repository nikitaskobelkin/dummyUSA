enum DataYear: Hashable {
    case latest
    case `default`(Int)
    case allTime

    var query: String? {
        switch self {
        case .latest: "latest"
        case .default(let year): String(year)
        default: nil
        }
    }
}
