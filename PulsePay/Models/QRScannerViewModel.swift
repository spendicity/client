import SwiftUI
import AVFoundation
import Combine

final class QRScannerViewModel: NSObject,
                                ObservableObject,
                                AVCaptureMetadataOutputObjectsDelegate {

    let session = AVCaptureSession()

    @Published var isFlashOn = false
    @Published var scanLineY: CGFloat = -110

    private var videoDevice: AVCaptureDevice?

    override init() {
        super.init()
        configureSession()
        monitorBrightness()
    }

    // MARK: - Camera Setup
    private func configureSession() {
        guard let device = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: device) else { return }

        videoDevice = device

        let output = AVCaptureMetadataOutput()
        output.setMetadataObjectsDelegate(self, queue: .main)

        session.beginConfiguration()

        if session.canAddInput(input) {
            session.addInput(input)
        }
        if session.canAddOutput(output) {
            session.addOutput(output)
        }

        output.metadataObjectTypes = [.qr]
        session.commitConfiguration()
    }

    // MARK: - Start / Stop
    func startScanning() {
        if !session.isRunning {
            session.startRunning()
            scanLineY = 110
        }
    }

    func stopScanning() {
        if session.isRunning {
            session.stopRunning()
        }
    }

    // MARK: - Flash
    func toggleFlash() {
        guard let device = videoDevice, device.hasTorch else { return }

        do {
            try device.lockForConfiguration()
            device.torchMode = isFlashOn ? .off : .on
            device.unlockForConfiguration()
            isFlashOn.toggle()
        } catch {
            print("Flash error")
        }
    }

    // MARK: - Auto Flash (iOS 26 Safe)
    private func currentScreenBrightness() -> CGFloat {
        guard let scene = UIApplication.shared.connectedScenes
                .first as? UIWindowScene else { return 1.0 }
        return scene.screen.brightness
    }

    private func monitorBrightness() {
        NotificationCenter.default.addObserver(
            forName: UIScreen.brightnessDidChangeNotification,
            object: nil,
            queue: .main
        ) { _ in
            if self.currentScreenBrightness() < 0.2 {
                self.enableFlashIfNeeded()
            }
        }
    }

    private func enableFlashIfNeeded() {
        guard let device = videoDevice,
              device.hasTorch,
              !isFlashOn else { return }

        try? device.lockForConfiguration()
        device.torchMode = .on
        device.unlockForConfiguration()
        isFlashOn = true
    }

    // MARK: - QR Result (Hook later)
    func metadataOutput(
        _ output: AVCaptureMetadataOutput,
        didOutput metadataObjects: [AVMetadataObject],
        from connection: AVCaptureConnection
    ) {
        if let object = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
           let value = object.stringValue {
            print("Scanned QR:", value)
            // Route to utility later
        }
    }
}
