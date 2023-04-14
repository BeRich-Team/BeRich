import SwiftUI

struct ListScreen: View {
    private let navigationTitle = "BeRich"
    @State private var tickers: [Ticker] = Fakes.tickers
    @StateObject var tradingDataNetworkFetcher = TradingDataNetworkFetcher(request: NetworkService.request)
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(tickers) { ticker in
                        NavigationLink {
                            DetailedTickerScreen(ticker: ticker)
                        } label: {
                            TickerCellView(ticker: ticker)
                                .listRowInsets(EdgeInsets(.zero))
                                .listRowSeparator(.hidden)
                        }
                    }
                }
                .padding(.top, 12)
            }.onAppear { tradingDataNetworkFetcher.getTickers(completion: { binanceTikers in
                print(binanceTikers!)
            }
            ) }
            .scrollContentBackground(.hidden)
            .background(Color.background)
            .navigationTitle(navigationTitle)
        }
        .accentColor(.white)
    }
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen()
    }
}
