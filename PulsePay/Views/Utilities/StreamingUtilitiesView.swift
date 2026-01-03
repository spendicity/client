import SwiftUI

struct StreamingUtilitiesView: View {

    let items: [DashboardItem]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            Text("Streaming Utilities")
                .font(.title2.bold())
                .foregroundColor(.white)

            LazyVGrid(
                columns: Array(repeating: .init(.flexible()), count: 4),
                spacing: 16
            ) {
                ForEach(items, id: \.id) { item in
                    NavigationLink {
                        destinationView(for: item)
                    } label: {
                        ActionIcon(item: item)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    // MARK: - Destination Router
    @ViewBuilder
    private func destinationView(for item: DashboardItem) -> some View {
        switch item.title {
        case "EV Charging":
            EVChargingView()
        case "Public WiFi":
            PublicWiFiView()
        case "Smart Parking":
            SmartParkingView()
        case "Work Pods":
            WorkPodsView()
        default:
            EmptyView()
        }
    }
}
