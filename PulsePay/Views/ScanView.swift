import SwiftUI
import PhotosUI

struct ScanView: View {

    @Binding var selectedTab: Int
    @StateObject private var scanner = QRScannerViewModel()
    @State private var showPhotoPicker = false

    private let bgColor = Color(red: 4/255, green: 11/255, blue: 27/255)

    var body: some View {
        ZStack {

            bgColor.ignoresSafeArea()

            VStack {

                // 🔝 TOP BAR
                HStack {

                    Button {
                        selectedTab = 0
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.white)
                    }

                    Spacer()

                    Button {
                        scanner.toggleFlash()
                    } label: {
                        Image(systemName: scanner.isFlashOn
                              ? "lightbulb.fill"
                              : "lightbulb")
                            .font(.title2)
                            .foregroundColor(.white)
                    }

                    Button {
                        showPhotoPicker = true
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.leading, 14)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 12)

                Spacer(minLength: 40)

                // 🟩 SCANNER BOX
                ZStack {
                    CameraPreview(session: scanner.session)
                        .frame(width: 280, height: 280)
                        .clipShape(RoundedRectangle(cornerRadius: 22))

                    ScannerCorners()
                        .stroke(Color.green, lineWidth: 6)
                        .frame(width: 280, height: 280)
                }

                Spacer()

                Text("Scan any UPI QR code to pay")
                    .foregroundColor(.white.opacity(0.85))
                    .font(.headline)
                    .padding(.bottom, 30)
            }

            // ✅ SUCCESS OVERLAY
            if scanner.showSuccess {
                ScanSuccessOverlay()
                    .transition(.scale.combined(with: .opacity))
            }
        }
        .onAppear { scanner.startScanning() }
        .onDisappear { scanner.stopScanning() }
        .photosPicker(
            isPresented: $showPhotoPicker,
            selection: .constant(nil),
            matching: .images
        )
    }
}
