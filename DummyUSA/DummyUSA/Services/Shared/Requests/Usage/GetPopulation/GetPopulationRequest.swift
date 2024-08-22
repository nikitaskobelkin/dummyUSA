import Alamofire
import Foundation

struct GetPopulationRequest: NetworkingRequest {
    typealias ResponseType = PopulationResponse

    let measures: DataMeasures
    let drillwdowns: DataDrilldowns
    let year: DataYear

    var requestDescriptor: RequestDescriptor {
        RequestDescriptor(
            baseUrl: NetworkConstants.Environment.production.baseURL,
            path: NetworkConstants.Endpoint.data.rawValue,
            method: .get,
            headers: Dictionary(headers),
            params: Dictionary(query),
            encoding: URLEncoding.default
        )
    }
}

private extension GetPopulationRequest {
    var headers: RequestHeaders {
        .init(contentType: .json, accept: .json)
    }

    var query: GetPopulationQuery {
        .init(
            drilldowns: drillwdowns,
            measures: measures,
            year: year.query
        )
    }
}
