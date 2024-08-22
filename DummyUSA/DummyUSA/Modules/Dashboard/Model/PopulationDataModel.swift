import Foundation

struct PopulationDataModel: Hashable {
    let year: Int
    let value: [PopulationValueModel]

    init?(year: Int, data: [PopulationModel]) {
        guard !data.isEmpty else { return nil }

        self.year = year

        value = data.compactMap {
            guard let origin = $0.nation ?? $0.state,
                  let population = $0.population
            else { return nil }

            return PopulationValueModel(
                origin: origin,
                population: population,
                slug: $0.slugNation ?? $0.slugState
            )
        }
        .sorted(by: { $0.population > $1.population })
    }

    struct PopulationValueModel: Identifiable, Hashable {
        let id: UUID = UUID()
        let origin: String
        let population: Int
        let slug: String?
    }
}

extension PopulationDataModel {
    var groupPreview: String {
        if let first = value.first, isSingleValue {
            first.origin
        } else {
            "\(value.count)"
        }
    }

    var isSingleValue: Bool {
        value.count == 1
    }
}
