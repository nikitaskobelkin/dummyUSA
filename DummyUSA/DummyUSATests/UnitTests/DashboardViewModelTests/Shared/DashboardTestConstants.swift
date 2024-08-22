@testable import DummyUSA

enum DashboardTestConstants {
    static let nationResponse = PopulationResponse(
        data: [
            PopulationModel(
                idState: nil,
                idNation: "001",
                state: nil,
                nation: "United States",
                idYear: 2023,
                year: "2023",
                population: 1000000,
                slugState: nil,
                slugNation: "test-nation"
            )
        ],
        source: []
    )

    static let statesResponse = PopulationResponse(
        data: [
            PopulationModel(
                idState: "001",
                idNation: nil,
                state: "California",
                nation: nil,
                idYear: 2023,
                year: "2023",
                population: 1000000,
                slugState: "california",
                slugNation: nil
            ),
            PopulationModel(
                idState: "002",
                idNation: nil,
                state: "Texas",
                nation: nil,
                idYear: 2023,
                year: "2023",
                population: 100,
                slugState: nil,
                slugNation: nil
            ),
            PopulationModel(
                idState: "001",
                idNation: nil,
                state: "California",
                nation: nil,
                idYear: 2022,
                year: "2022",
                population: 1000000,
                slugState: "california",
                slugNation: nil
            ),
            PopulationModel(
                idState: "002",
                idNation: nil,
                state: "Texas",
                nation: nil,
                idYear: 2022,
                year: "2022",
                population: 100,
                slugState: nil,
                slugNation: nil
            )
        ],
        source: []
    )

    static let nationMultiple = PopulationResponse(
        data: [
            PopulationModel(
                idState: nil,
                idNation: "001",
                state: nil,
                nation: "Test Nation 1",
                idYear: 2022,
                year: "2022",
                population: 500000,
                slugState: nil,
                slugNation: "test-nation-1"
            ),
            PopulationModel(
                idState: nil,
                idNation: "002",
                state: nil,
                nation: "Test Nation 2",
                idYear: 2023,
                year: "2023",
                population: 1500000,
                slugState: nil,
                slugNation: "test-nation-2"
            )
        ],
        source: []
    )

    static let constantYears: Int = 2
    static let constantStates: Int = 2
    static let timeout: Int = 2
}
