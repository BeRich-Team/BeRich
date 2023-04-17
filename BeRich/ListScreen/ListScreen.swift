import SwiftUI

struct ListScreen: View {
    @StateObject private var viewModel: ListScreenViewModel
    @State private var searchText = ""

    init(viewModel: ListScreenViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    @State private var tickers: [Ticker] = Fakes.tickers
    @StateObject private var tradingDataNetworkFetcher = TradingDataNetworkFetcher()

    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .initial:
                    Color.background
                case .loading:
                    loading()
                case let .loaded(tickers):
                    list(tickers)
                case .error:
                    error()
                }
            }
            .padding(.horizontal, 16.0)
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color.background)
            .foregroundColor(.white)
            .navigationTitle(screenTitle)
        }
        .accentColor(.white)
        .onAppear { viewModel.send(event: .didAppear) }
    }

    private func loading() -> some View {
        ZStack {
            Color.background
            ProgressView()
        }
    }

    private func list(_ tickers: [Ticker]) -> some View {
        List(tickers, id: \.title) { ticker in
            TickerCellView(ticker: ticker)
                .background(
                    NavigationLink("", destination: DetailedTickerScreen(ticker: ticker)).opacity(0)
                )
                .listRowSeparator(.hidden)
                .listRowBackground(
                    Color.white
                        .cornerRadius(cellCornerRadius)
                        .addBorder(Color.stroke, width: 0.5, cornerRadius: cellCornerRadius)
                        .shadow(color: .shadow, radius: 8, y: 4)
                        .padding(.vertical, 8)
                )
        }
        .searchable(
            text: $searchText
        )
    }

    private func error() -> some View {
        ZStack {
            Color.background
            VStack(spacing: 12.0) {
                Text(defaultErrorMessage)
                    .foregroundColor(Color(UIColor.label))
                Button(tryAgain) { viewModel.send(event: .didSelectReload) }
                    .foregroundColor(Color.blueMain)
                    .font(Font.headline)
            }
            .multilineTextAlignment(.center)
        }
    }
}

private let cellCornerRadius = 16.0
private let screenTitle = "BeRich"
private let defaultErrorMessage = "К сожалению, что-то пошло не так"
private let tryAgain = "Попробовать ещё раз"

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen(viewModel: Fakes.makeListScreenViewModel())
    }
}
