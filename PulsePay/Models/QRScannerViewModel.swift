import SwiftUI
import AVFoundation
import Combine

final class QRScannerViewModel: NSObject,
                                ObservableObject,
                                AVCaptureMetadataOutputObjectsDelegate {

    // MARK: - Public
    let session = AVCaptureSession()

    @Published var isFlashOn = false
    @Published var scanLineY: CGFloat = -110

    // MARK: - Private
    private let sessionQueue = DispatchQueue(label: "qr.camera.session.queue")
    private var videoDevice: AVCaptureDevice?

    override init() {
        super.init()

        sessionQueue.async { [weak self] in
            self?.configureSession()
        }

        monitorBrightness()
    }

    // MARK: - Camera Setup (BACKGROUND THREAD)
    private func configureSession() {
        session.beginConfiguration()

        guard let device = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: device) else {
            session.commitConfiguration()
            return
        }

        videoDevice = device

        let output = AVCaptureMetadataOutput()
        output.setMetadataObjectsDelegate(self, queue: .main)

        if session.canAddInput(input) {
            session.addInput(input)
        }

        if session.canAddOutput(output) {
            session.addOutput(output)
            output.metadataObjectTypes = [.qr]
        }

        session.commitConfiguration()
    }

    // MARK: - Start / Stop (BACKGROUND THREAD)
    func startScanning() {
        sessionQueue.async { [weak self] in
            guard let self = self, !self.session.isRunning else { return }
            self.session.startRunning()

            DispatchQueue.main.async {
                self.scanLineY = 110
            }
        }
    }

    func stopScanning() {
        sessionQueue.async { [weak self] in
            guard let self = self, self.session.isRunning else { return }
            self.session.stopRunning()
        }
    }

    // MARK: - Flash (SAFE)
    func toggleFlash() {
        guard let device = videoDevice, device.hasTorch else { return }

        sessionQueue.async {
            do {
                try device.lockForConfiguration()
                device.torchMode = self.isFlashOn ? .off : .on
                device.unlockForConfiguration()

                DispatchQueue.main.async {
                    self.isFlashOn.toggle()
                }
            } catch {
                print("Flash error")
            }
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
        ) { [weak self] _ in
            guard let self = self else { return }
            if self.currentScreenBrightness() < 0.2 {
                self.enableFlashIfNeeded()
            }
        }
    }

    private func enableFlashIfNeeded() {
        guard let device = videoDevice,
              device.hasTorch,
              !isFlashOn else { return }

        sessionQueue.async {
            try? device.lockForConfiguration()
            device.torchMode = .on
            device.unlockForConfiguration()

            DispatchQueue.main.async {
                self.isFlashOn = true
            }
        }
    }

    // MARK: - QR Result (HOOK FOR LATER)
    func metadataOutput(
        _ output: AVCaptureMetadataOutput,
        didOutput metadataObjects: [AVMetadataObject],
        from connection: AVCaptureConnection
    ) {
        if let object = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
           let value = object.stringValue {

            print("Scanned QR:", value)
            // 🚦 Route to EV / WiFi later
        }
    }
}
