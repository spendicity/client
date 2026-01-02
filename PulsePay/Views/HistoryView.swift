import SwiftUI

struct HistoryView: View {

    // MARK: - Model
    struct Transaction: Identifiable {
        let id = UUID()
        let name: String
        let amount: Int
        let date: String
        let isReceived: Bool
    }

    // MARK: - State
    @State private var selectedTab = 0
    @State private var searchText = ""

    // MARK: - Colors
    let darkBG = Color(red: 10/255, green: 14/255, blue: 25/255)
    let cardWhite = Color(red: 245/255, green: 247/255, blue: 250/255)
    let textPrimary = Color.black.opacity(0.85)
    let textSecondary = Color.gray.opacity(0.75)
    let greenSoft = Color(red: 46/255, green: 160/255, blue: 90/255)
    let redSoft = Color(red: 210/255, green: 70/255, blue: 70/255)
    let accentBlue = Color(red: 70/255, green: 130/255, blue: 255/255)

    // MARK: - Data
    let transactions: [Transaction] = [
        .init(name: "Tapan Kumar Mukhopadhyay", amount: 10000, date: "02 Nov, 08:06 AM", isReceived: true),
        .init(name: "Tapan Kumar Mukhopadhyay", amount: 150, date: "01 Nov, 09:45 PM", isReceived: true),
        .init(name: "Amazon Pay", amount: 200, date: "31 Oct, 09:50 PM", isReceived: false),
        .init(name: "Flipkart", amount: 186, date: "31 Oct, 07:44 PM", isReceived: false)
    ]

    var filteredTransactions: [Transaction] {
        searchText.isEmpty ? transactions :
        transactions.filter {
            $0.name.lowercased().contains(searchText.lowercased()) ||
            "\($0.amount)".contains(searchText) ||
            $0.date.lowercased().contains(searchText.lowercased())
        }
    }

    var body: some View {
        ZStack {

            darkBG.ignoresSafeArea()

            VStack(spacing: 0) {

                // 🔝 HEADER
                VStack(alignment: .leading, spacing: 16) {

                    HStack(spacing: 28) {
                        tabItem("Pluse Pay", 0)
                        tabItem("Bank A/C", 1)
                        tabItem("Credit Card", 2)
                    }
                    .padding(.top, 16)

                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white.opacity(0.6))
                            TextField("Search transactions", text: $searchText)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.white.opacity(0.12))
                        .cornerRadius(16)

                        Button("Help?") {}
                            .foregroundColor(.white.opacity(0.9))
                            .padding(.horizontal, 18)
                            .padding(.vertical, 14)
                            .background(Color.white.opacity(0.12))
                            .cornerRadius(16)
                    }
                }
                .padding()

                // 🤍 CONTENT CARD
                ZStack {
                    cardWhite
                        .clipShape(RoundedRectangle(cornerRadius: 28))
                        .ignoresSafeArea(edges: .bottom)

                    VStack(spacing: 0) {

                        HStack {
                            Text("02 NOV 2025")
                                .font(.caption)
                                .foregroundColor(textSecondary)

                            Spacer()

                            Label("Filter", systemImage: "line.3.horizontal.decrease")
                                .foregroundColor(accentBlue)
                        }
                        .padding()

                        Divider().opacity(0.15)

                        ScrollView {
                            VStack(spacing: 0) {
                                ForEach(filteredTransactions) { txn in
                                    transactionRow(txn)
                                }

                                if filteredTransactions.isEmpty {
                                    Text("No transactions found")
                                        .foregroundColor(textSecondary)
                                        .padding(.top, 40)
                                }
                            }
                        }
                    }

                    // 📄 STATEMENT
                    VStack {
                        Spacer()
                        Label("Statement", systemImage: "arrow.down.circle")
                            .padding()
                            .background(cardWhite)
                            .cornerRadius(24)
                            .shadow(color: .black.opacity(0.1), radius: 8)
                            .padding(.bottom, 20)
                    }
                }
            }
        }
    }

    // MARK: - Tabs
    private func tabItem(_ title: String, _ index: Int) -> some View {
        VStack(spacing: 6) {
            Button { selectedTab = index } label: {
                Text(title)
                    .font(.headline)
                    .foregroundColor(selectedTab == index ? .white : .white.opacity(0.6))
            }

            if selectedTab == index {
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: 24, height: 3)
                    .cornerRadius(2)
            }
        }
    }

    // MARK: - Row
    private func transactionRow(_ txn: Transaction) -> some View {
        VStack {
            HStack(spacing: 14) {

                Circle()
                    .fill(accentBlue)
                    .frame(width: 44, height: 44)
                    .overlay(
                        Text(txn.isReceived ? "R" : "S")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    )

                VStack(alignment: .leading, spacing: 4) {
                    Text("\(txn.isReceived ? "Received from" : "Paid to") \(txn.name)")
                        .foregroundColor(textPrimary)
                        .font(.headline)

                    Text(txn.date)
                        .font(.caption)
                        .foregroundColor(textSecondary)
                }

                Spacer()

                HStack(spacing: 4) {
                    Image(systemName: txn.isReceived ? "arrow.down.left" : "arrow.up.right")
                        .foregroundColor(txn.isReceived ? greenSoft : redSoft)

                    Text("₹\(txn.amount)")
                        .font(.headline)
                        .foregroundColor(txn.isReceived ? greenSoft : redSoft)
                }
            }
            .padding()

            Divider().opacity(0.12)
        }
    }
}
