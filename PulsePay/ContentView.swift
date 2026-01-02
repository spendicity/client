import SwiftUI

struct ContentView: View {

    @State private var showHome = false

    var body: some View {
        if showHome {
            MainTabView()
        } else {
            SplashView(showHome: $showHome)
        }
    }
}
