import SwiftUI

struct AlertsView: View {

    // MARK: - Alert Model (UX only)
    struct AlertItem: Identifiable {
        let id = UUID()
        let title: String
        let message: String
        let time: String
        let type: AlertType
    }

    enum AlertType {
        case success
        case warning
        case error
        case info

        var color: Color {
            switch self {
            case .success:
                return AppColors.positive
            case .warning:
                return .yellow
            case .error:
                return AppColors.negative
            case .info:
                return AppColors.accentBlue
            }
        }

        var icon: String {
            switch self {
            case .success:
                return "checkmark.circle.fill"
            case .warning:
                return "exclamationmark.triangle.fill"
            case .error:
                return "xmark.octagon.fill"
            case .info:
                return "info.circle.fill"
            }
        }
    }

    // MARK: - Sample Alerts
    private let alerts: [AlertItem] = [
        .init(
            title: "Streaming Active",
            message: "EV Charging session is currently live.",
            time: "Just now",
            type: .success
        ),
        .init(
            title: "Low Balance Warning",
            message: "Your balance is running low. Please top up.",
            time: "5 mins ago",
            type: .warning
        ),
        .init(
            title: "Payment Failed",
            message: "Auto settlement failed. Retry required.",
            time: "Today, 9:10 AM",
            type: .error
        ),
        .init(
            title: "New Feature",
            message: "Smart Parking is now available near you.",
            time: "Yesterday",
            type: .info
        )
    ]

    var body: some View {
        ZStack {

            // 🖤 DARK BACKGROUND
            AppColors.darkBG
                .ignoresSafeArea()

            VStack(spacing: 0) {

                // 🔝 HEADER
                HStack {
                    Text("Alerts")
                        .font(.largeTitle.bold())
                        .foregroundColor(AppColors.textOnDark)

                    Spacer()

                    Image(systemName: "bell.fill")
                        .foregroundColor(AppColors.textMutedOnDark)
                }
                .padding()

                // 📂 CONTENT
                ScrollView {
                    VStack(spacing: 16) {

                        if alerts.isEmpty {
                            // 📭 EMPTY STATE
                            VStack(spacing: 12) {
                                Image(systemName: "bell.slash")
                                    .font(.system(size: 36))
                                    .foregroundColor(AppColors.textMutedOnDark)

                                Text("No alerts")
                                    .font(.headline)
                                    .foregroundColor(AppColors.textOnDark)

                                Text("You're all caught up.")
                                    .font(.caption)
                                    .foregroundColor(AppColors.textMutedOnDark)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.top, 80)
                        } else {
                            // 🔔 ALERT LIST
                            ForEach(alerts) { alert in
                                AlertRow(alert: alert)
                            }
                        }

                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}
