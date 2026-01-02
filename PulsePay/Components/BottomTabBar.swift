import SwiftUI

struct BottomTabBar: View {

    @Binding var selectedTab: Int

    var body: some View {
        HStack {

            tab(icon: "house.fill", title: "Home", index: 0)
            tab(icon: "magnifyingglass", title: "Search", index: 1)

            Button {
                selectedTab = 2
            } label: {
                Circle()
                    .fill(Color.purple)
                    .frame(width: 62, height: 62)
                    .overlay(
                        Image(systemName: "qrcode.viewfinder")
                            .foregroundColor(.white)
                            .font(.title)
                    )
            }
            .offset(y: -20)

            tab(icon: "bell", title: "Alerts", index: 3)
            tab(icon: "clock", title: "History", index: 4)
        }
        .padding(.horizontal)
        .padding(.top, 10)
        .background(Color.black)
    }

    private func tab(icon: String, title: String, index: Int) -> some View {
        Button {
            selectedTab = index
        } label: {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .foregroundColor(selectedTab == index ? .white : .gray)

                Text(title)
                    .font(.caption2)
                    .foregroundColor(selectedTab == index ? .white : .gray)
            }
            .frame(maxWidth: .infinity)
        }
    }
}
