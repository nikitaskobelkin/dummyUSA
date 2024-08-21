enum RequestContentType: String, Encodable {
    case json = "application/json"
    case text = "text/plain"
    case form = "multipart/form-data"
}
