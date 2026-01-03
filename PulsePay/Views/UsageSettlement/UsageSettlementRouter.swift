import SwiftUI

struct UsageSettlementRouter {

    @ViewBuilder
    static func destinationView(for item: DashboardItem) -> some View {
        switch item.title {
        case "Live Usage":
            LiveUsageView()
        case "Live Balance":
            LiveBalanceView()
        case "Session History":
            SessionHistoryView()
        case "Auto Settlement":
            AutoSettlementView()
        default:
            EmptyView()
        }
    }
}
