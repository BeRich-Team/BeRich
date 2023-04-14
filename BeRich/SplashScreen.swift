import SwiftUI

struct SplashView: View {
    @State var isActive = false
    let animationTime = 0.5

    var body: some View {
        VStack {
            if isActive {
                ListScreen()
            } else {
                Image("logo.splash")
                    .resizable()
                    .scaledToFit()
                    .padding(32)
            }
        }
        .ignoresSafeArea(.all)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + animationTime) {
                withAnimation {
                    isActive.toggle()
                }
            }
        }
    }
}
