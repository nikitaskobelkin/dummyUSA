import Alamofire

protocol NetworkingRequest {
    associatedtype ResponseType: Decodable
    var requestDescriptor: RequestDescriptor { get }
}
