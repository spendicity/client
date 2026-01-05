import SwiftUI

struct ActionIcon: View {

    let item: DashboardItem

    var body: some View {
        VStack(spacing: 8) {

            Circle()
                .fill(Color.green)
                .frame(width: 56, height: 56)
                .overlay(
                    Image(systemName: item.icon)
                        .foregroundColor(.white)
                        .font(.system(size: 22))
                )

            Text(item.title)
                .font(.caption)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
    }
}
