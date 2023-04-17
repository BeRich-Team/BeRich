import SwiftUI

extension ListScreen {
    static func make() -> some View {
        ListScreen(
            viewModel: ListScreenViewModel(
                useCase: ListScreenUseCaseImpl(
                    fetcher: TradingDataNetworkFetcher()
                )
            )
        )
    }
}
