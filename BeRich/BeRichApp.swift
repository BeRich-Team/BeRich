import SwiftUI

@main
struct BeRichApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var tradingDataNetworkFetcher = TradingDataNetworkFetcher(request: NetworkService.request)
    var body: some Scene {
        WindowGroup {
            ListScreen().onAppear { tradingDataNetworkFetcher.getTickers(completion: { binanceTikers in
                print(binanceTikers!)
            })
            }
            SplashView()
        }
    }
}
