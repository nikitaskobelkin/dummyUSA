import Foundation

struct GetPopulationQuery: Encodable {
    let drilldowns: DataDrilldowns
    let measures: DataMeasures
    let year: String?
}
