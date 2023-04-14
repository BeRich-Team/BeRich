import SwiftUI

struct TickerCellView: View {
    let ticker: Ticker

    @State private var isFavourite = false

    var body: some View {
        Group {
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(ticker.title)
                        .font(.title2)
                    Text(ticker.subTitle)
                        .font(Font.subheadline)
                        .foregroundColor(.gray500)
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 0) {
                    Text(ticker.price)
                        .font(.title)
                        .foregroundColor(Color.yellowMain)
                    Text(ticker.priceChange.text)
                        .frame(width: 70)
                        .font(Font.subheadline)
                        .foregroundColor(Color.white)
                        .padding(2)
                        .background(ticker.priceChange.color)
                        .cornerRadius(4)
                }
                .padding(.trailing, 8)

                Button {
                    isFavourite.toggle()
                } label: {
                    Image(systemName: isFavourite ? "star.fill" : "star")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.yellowMain)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.stroke, lineWidth: 1)
        )
        .addBorder(Color.stroke, width: 0.5, cornerRadius: 16)
        .padding(.vertical, 4)
        .background(Color.background)
    }
}

extension PriceChange {
    var text: String {
        switch self {
        case let .increase(priceChange):
            return "+\(priceChange)"
        case .stable:
            return "0.0"
        case let .decrease(priceChange):
            return "-\(priceChange)"
        }
    }
}

struct TickerCellView_Previews: PreviewProvider {
    static var previews: some View {
        TickerCellView(ticker: Ticker(title: "Title",
                                      subTitle: "Subtitle",
                                      price: "100$",
                                      priceChange: .increase(100)))
    }
}
