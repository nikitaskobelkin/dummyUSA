enum RequestAuthorisation: Encodable {
    case bearer(accessToken: String)
}

extension RequestAuthorisation {
    var value: String {
        switch self {
        case .bearer(let token): return "Bearer " + token
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
