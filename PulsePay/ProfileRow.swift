import SwiftUI

struct ProfileRow: View {

    let icon: String
    let title: String

    var body: some View {
        HStack(spacing: 14) {

            Image(systemName: icon)
                .foregroundColor(.purple)
                .font(.system(size: 22))

            Text(title)
                .foregroundColor(.white)
                .font(.body)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 10)
    }
}
