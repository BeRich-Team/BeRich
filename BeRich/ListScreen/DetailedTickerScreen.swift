import SwiftUI

struct DetailedTickerScreen: View {
    @State var isFavourite = false

    init(ticker: Ticker) {
        self.ticker = ticker
    }

    private let ticker: Ticker

    var body: some View {
        Text(ticker.title)
            .navigationBarTitle(ticker.title)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isFavourite.toggle()
                    } label: {
                        Image(systemName: isFavourite ? "star.fill" : "star")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.yellowMain)
                    }
                }
            }
    }
}

struct DetailedTickerScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailedTickerScreen(
            ticker: Ticker(title: "Title",
                           subTitle: "Subtitle",
                           price: "price",
                           priceChange: .stable)
        )
    }
}
