import XCTest
import Combine
@testable import DummyUSA

final class DashboardViewModelTests: XCTestCase {
    private typealias Constants = DashboardTestConstants
    private var cancellables = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    @MainActor
    func testFetchSuccess() async {
        InjectedValues[\.dashboardDataSource] = MockDashboardDataSource(
            result: .success(Constants.nationResponse)
        )

        let viewModel = DashboardViewModel()
        let fetchExpectation = expectation(description: "Fetch")

        viewModel.$isLoading
            .receive(on: DispatchQueue.main)
            .dropFirst()
            .filter({ !$0 })
            .sink(receiveValue: { isLoading in
                XCTAssertEqual(viewModel.data.count, Constants.nationResponse.data.count)
                XCTAssertFalse(isLoading)
                XCTAssertNil(viewModel.fetchingError)
                fetchExpectation.fulfill()
            })
            .store(in: &cancellables)

        viewModel.fetch()
        await fulfillment(of: [fetchExpectation], timeout: TimeInterval(Constants.timeout))
    }

    @MainActor
    func testFetchNoConnectionError() async {
        InjectedValues[\.dashboardDataSource] = MockDashboardDataSource(
            result: .failure(.noConnection)
        )

        let viewModel = DashboardViewModel()
        let fetchExpectation = expectation(description: "Fetch")

        viewModel.$isLoading
            .receive(on: DispatchQueue.main)
            .dropFirst()
            .filter({ !$0 })
            .sink(receiveValue: { isLoading in
                XCTAssertTrue(viewModel.data.isEmpty)
                XCTAssertFalse(isLoading)
                XCTAssertEqual(viewModel.fetchingError, .connection)
                fetchExpectation.fulfill()
            })
            .store(in: &cancellables)

        viewModel.fetch()
        await fulfillment(of: [fetchExpectation], timeout: TimeInterval(Constants.timeout))
    }

    @MainActor
    func testFetchServerError() async {
        InjectedValues[\.dashboardDataSource] = MockDashboardDataSource(
            result: .failure(.forbidden)
        )

        let viewModel = DashboardViewModel()
        let fetchExpectation = expectation(description: "Fetch")

        viewModel.$isLoading
            .receive(on: DispatchQueue.main)
            .dropFirst()
            .filter({ !$0 })
            .sink(receiveValue: { isLoading in
                XCTAssertTrue(viewModel.data.isEmpty)
                XCTAssertFalse(isLoading)
                XCTAssertEqual(viewModel.fetchingError, .server)
                fetchExpectation.fulfill()
            })
            .store(in: &cancellables)

        viewModel.fetch()
        await fulfillment(of: [fetchExpectation], timeout: TimeInterval(Constants.timeout))
    }

    @MainActor
    func testFetchEmptyResponse() async {
        InjectedValues[\.dashboardDataSource] = MockDashboardDataSource(
            result: .success(PopulationResponse(data: [], source: []))
        )

        let viewModel = DashboardViewModel()
        let fetchExpectation = expectation(description: "Fetch")

        viewModel.$isLoading
            .receive(on: DispatchQueue.main)
            .dropFirst()
            .filter({ !$0 })
            .sink(receiveValue: { isLoading in
                XCTAssertTrue(viewModel.data.isEmpty)
                XCTAssertFalse(isLoading)
                XCTAssertNil(viewModel.fetchingError)
                fetchExpectation.fulfill()
            })
            .store(in: &cancellables)

        viewModel.fetch()
        await fulfillment(of: [fetchExpectation], timeout: TimeInterval(Constants.timeout))
    }

    @MainActor
    func testFetchWithMultipleYears() async {
        InjectedValues[\.dashboardDataSource] = MockDashboardDataSource(
            result: .success(Constants.nationMultiple)
        )

        let viewModel = DashboardViewModel()
        let fetchExpectation = expectation(description: "Fetch")

        viewModel.$isLoading
            .receive(on: DispatchQueue.main)
            .dropFirst()
            .filter({ !$0 })
            .sink(receiveValue: { isLoading in
                let years = viewModel.data.map { $0.year }
                XCTAssertEqual(years.count, Constants.constantYears)
                XCTAssertFalse(isLoading)
                XCTAssertNil(viewModel.fetchingError)
                fetchExpectation.fulfill()
            })
            .store(in: &cancellables)

        viewModel.fetch()
        await fulfillment(of: [fetchExpectation], timeout: TimeInterval(Constants.timeout))
    }

    @MainActor
    func testFetchWithMultipleStates() async {
        InjectedValues[\.dashboardDataSource] = MockDashboardDataSource(
            result: .success(Constants.statesResponse)
        )

        let viewModel = DashboardViewModel()
        let fetchExpectation = expectation(description: "Fetch")
        

        viewModel.$isLoading
            .receive(on: DispatchQueue.main)
            .dropFirst()
            .filter({ !$0 })
            .sink(receiveValue: { isLoading in
                let years = viewModel.data.map { $0.year }
                XCTAssertEqual(years.count, Constants.constantYears)
                XCTAssertEqual(viewModel.data.first?.value.count, Constants.constantStates)
                XCTAssertFalse(isLoading)
                XCTAssertNil(viewModel.fetchingError)
                fetchExpectation.fulfill()
            })
            .store(in: &cancellables)

        viewModel.fetch()
        await fulfillment(of: [fetchExpectation], timeout: TimeInterval(Constants.timeout))
    }
}
