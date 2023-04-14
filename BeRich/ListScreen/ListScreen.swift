import SwiftUI

struct ListScreen: View {
    private let navigationTitle = "BeRich"
    @State private var tickers: [Ticker] = Fakes.tickers

    var body: some View {
        NavigationStack {
            List(tickers) { ticker in
                TickerCellView(ticker: ticker)
                    .listRowInsets(EdgeInsets(.zero))
                    .listRowSeparator(.hidden)
            }
            .scrollContentBackground(.hidden)
            .background(Color.background)
            .navigationTitle(navigationTitle)
        }
    }
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen()
    }
}
