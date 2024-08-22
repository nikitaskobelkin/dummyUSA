import Foundation

extension Dictionary where Key == String, Value == Any {
    init(_ data: Encodable) {
        guard let jsonData = try? JSONEncoder().encode(data),
              let dictionary = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
        else {
            self = [:]
            return
        }
        self = dictionary
    }
}

extension Dictionary where Key == String, Value == String {
    init(_ data: Encodable) {
        self = Dictionary<String, Any>(data) as? [String: String] ?? [:]
    }
}
