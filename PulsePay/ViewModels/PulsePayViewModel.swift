import Foundation
import Combine

class PulsePayViewModel: ObservableObject {

    @Published var wallet = Wallet(
        balance: 150.00,
        ratePerSecond: 0.10,
        isActive: false
    )

    @Published var elapsedTime: Int = 0

    private var timer: AnyCancellable?

    func startService() {
        wallet.isActive = true

        timer = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.tick()
            }
    }

    func stopService() {
        wallet.isActive = false
        timer?.cancel()
    }

    private func tick() {
        guard wallet.balance > 0 else {
            stopService()
            return
        }

        wallet.balance -= wallet.ratePerSecond
        elapsedTime += 1
    }
}
