
import SwiftUI

struct ContentView: View {
    @StateObject private var networkFetcher = TradingDataNetworkFetcher(request: NetworkService.request)

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            networkFetcher.getTickers { binanceTickers in
                print(binanceTickers!.symbols)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
