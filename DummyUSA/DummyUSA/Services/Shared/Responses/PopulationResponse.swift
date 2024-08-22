import Foundation

// MARK: - PopulationResponse Model

struct PopulationResponse: Decodable {
    let data: [PopulationModel]
    let source: [Source] // not used in app, can be removed from this model
}

// MARK: - State Population Model

struct PopulationModel: Decodable {
    let idState: String?
    let idNation: String?
    let state: String?
    let nation: String?
    let idYear: Int?
    let year: String?
    let population: Int?
    let slugState: String?
    let slugNation: String?

    enum CodingKeys: String, CodingKey {
        case idState = "ID State"
        case idNation = "ID Nation"
        case state = "State"
        case nation = "Nation"
        case idYear = "ID Year"
        case year = "Year"
        case population = "Population"
        case slugState = "Slug State"
        case slugNation = "Slug Nation"
    }
}

// MARK: - Source Model

struct Source: Decodable {
    let measures: [String]?
    let annotations: Annotations?
    let name: String?
    let substitutions: [String]?
}

// MARK: - Annotations Model

struct Annotations: Decodable {
    let sourceName: String?
    let sourceDescription: String?
    let datasetName: String?
    let datasetLink: String?
    let tableID: String?
    let topic: String?
    let subtopic: String?

    enum CodingKeys: String, CodingKey {
        case sourceName = "source_name"
        case sourceDescription = "source_description"
        case datasetName = "dataset_name"
        case datasetLink = "dataset_link"
        case tableID = "table_id"
        case topic
        case subtopic
    }
}
