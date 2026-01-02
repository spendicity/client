import SwiftUI

struct ScannerCorners: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let length: CGFloat = 30

        // Top-left
        path.move(to: CGPoint(x: 0, y: length))
        path.addLine(to: .zero)
        path.addLine(to: CGPoint(x: length, y: 0))

        // Top-right
        path.move(to: CGPoint(x: rect.maxX - length, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: length))

        // Bottom-right
        path.move(to: CGPoint(x: rect.maxX, y: rect.maxY - length))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - length, y: rect.maxY))

        // Bottom-left
        path.move(to: CGPoint(x: length, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY - length))

        return path
    }
}
