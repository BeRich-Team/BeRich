import Combine
import Foundation

final class ListScreenViewModel: ObservableObject {
    @Published private(set) var state: State = .initial

    private let input = PassthroughSubject<Event, Never>()
    private let useCase: ListScreenUseCase

    init(useCase: ListScreenUseCase) {
        self.useCase = useCase

        Publishers.system(
            initial: state,
            reduce: Self.reduce,
            scheduler: RunLoop.main,
            feedbacks: [
                Self.loading(useCase: useCase),
                Self.userInput(input: input.eraseToAnyPublisher()),
            ]
        )
        .assign(to: &$state)
    }

    func send(event: Event) {
        input.send(event)
    }
}

// MARK: - Inner Types

extension ListScreenViewModel {
    enum State {
        case initial
        case loading
        case loaded([Ticker])
        case error
    }

    enum Event {
        case didAppear
        case didLoadTickers([Ticker])
        case failedLoadTickers
        case didSelectReload
    }
}

// MARK: - State Machine

extension ListScreenViewModel {
    static func reduce(_ state: State, _ event: Event) -> State {
        switch state {
        case .initial:
            switch event {
            case .didAppear:
                return .loading
            default:
                return state
            }
        case .loading:
            switch event {
            case let .didLoadTickers(tickers):
                return .loaded(tickers)
            case .failedLoadTickers:
                return .error
            default:
                return state
            }
        case .loaded:
            return state
        case .error:
            switch event {
            case .didSelectReload:
                return .loading
            default:
                return state
            }
        }
    }

    static func loading(useCase: ListScreenUseCase) -> Feedback<State, Event> {
        Feedback { (state: State) -> AnyPublisher<Event, Never> in
            guard case .loading = state else { return Empty().eraseToAnyPublisher() }

            return Future { promise in
                Task.detached {
                    do {
                        let tickers: [Ticker] = try await useCase.getTickers()
                        let event = Event.didLoadTickers(tickers)
                        promise(.success(event))
                    } catch {
                        promise(.success(Event.failedLoadTickers))
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }

    static func userInput(input: AnyPublisher<Event, Never>) -> Feedback<State, Event> {
        Feedback { _ in input }
    }
}
