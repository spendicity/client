import SwiftUI
import AVFoundation
import PhotosUI

struct ScanView: View {

    @Binding var selectedTab: Int
    @StateObject private var scanner = QRScannerViewModel()
    @State private var showPhotoPicker = false

    var body: some View {
        ZStack {

            // 🖤 DARK BRAND BACKGROUND
            AppColors.darkBG
                .ignoresSafeArea()

            VStack {

                // 🔝 TOP BAR
                HStack {

                    // ⬅️ BACK → HOME
                    Button {
                        selectedTab = 0
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(AppColors.textOnDark)
                    }

                    Spacer()

                    // 🔦 FLASH
                    Button {
                        scanner.toggleFlash()
                    } label: {
                        Image(systemName: scanner.isFlashOn
                              ? "lightbulb.fill"
                              : "lightbulb")
                            .font(.title2)
                            .foregroundColor(AppColors.textOnDark)
                    }

                    // ⬆️ UPLOAD
                    Button {
                        showPhotoPicker = true
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.title2)
                            .foregroundColor(AppColors.textOnDark)
                            .padding(.leading, 14)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 12)

                Spacer(minLength: 40)

                // 🟩 PERFECT SQUARE SCANNER
                ZStack {
                    CameraPreview(session: scanner.session)
                        .frame(width: 280, height: 280)
                        .clipShape(RoundedRectangle(cornerRadius: 22))

                    ScannerCorners()
                        .stroke(AppColors.positive, lineWidth: 6)
                        .frame(width: 280, height: 280)
                }

                Spacer()

                // 📄 INSTRUCTION
                Text("Scan any UPI QR code to pay")
                    .foregroundColor(AppColors.textOnDark.opacity(0.85))
                    .font(.headline)
                    .padding(.bottom, 30)
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
