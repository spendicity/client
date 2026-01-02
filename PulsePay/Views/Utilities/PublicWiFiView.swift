import SwiftUI

struct PublicWiFiView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "wifi")
                    .font(.system(size: 64))
                    .foregroundColor(.blue)

                Text("Public WiFi")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                Text("Pay only for data you consume")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Public WiFi")
        .navigationBarTitleDisplayMode(.inline)
    }
}
