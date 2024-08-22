enum DataYear {
    case latest
    case `default`(Int)

    var query: String {
        switch self {
        case .latest: "latest"
        case .default(let year): "\(year)"
        }
    }
}
