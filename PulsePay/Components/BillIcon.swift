import SwiftUI

struct BillIcon: View {

    let item: DashboardItem

    var body: some View {
        VStack(spacing: 10) {

            Circle()
                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                .frame(width: 54, height: 54)
                .overlay(
                    Image(systemName: item.icon)
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                )

            Text(item.title)
                .font(.caption)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
    }
}
