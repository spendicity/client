import SwiftUI

struct SplashView: View {

    @Binding var showHome: Bool

    // MARK: - Animation States
    @State private var logoScale: CGFloat = 0.85
    @State private var opacity: Double = 0

    // MARK: - BRAND CONFIG
    private let appName = "PulsePay"
    private let eventTagline = "On-Block 2026"
    private let textTagline = "For"
    

    var body: some View {
        ZStack {

            // 🖤 DARK BRAND BACKGROUND
            AppColors.darkBG
                .ignoresSafeArea()

            VStack(spacing: 10) {

                Spacer()

                // 🔷 MAIN APP LOGO (HOVER EFFECT)
                Image("Applogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 110)
                    .scaleEffect(logoScale)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(
                            .easeInOut(duration: 1.2)
                                .repeatForever(autoreverses: true)
                        ) {
                            logoScale = 1.05
                        }
                    }

                // 🏷️ APP NAME
                Text(appName)
                    .font(.largeTitle.bold())
                    .foregroundColor(AppColors.textOnDark)
                    .opacity(opacity)

                // 🧩 EVENT TAGLINE (NEW)
                Text(eventTagline)
                    .font(.caption)
                    .foregroundColor(AppColors.textMutedOnDark)
                    .opacity(opacity)
                
                // 🧩 EVENT TAGLINE (NEW)
                Text(textTagline)
                    .font(.caption)
                    .foregroundColor(AppColors.textMutedOnDark)
                    .opacity(opacity)
                    .frame(width: 90)

                // 🔹 KSITIJ LOGO (SECONDARY BRAND)
                Image("ksitij_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130)
                    .opacity(opacity)

                Spacer()
            }
        }
        .onAppear {

            // 🎬 FADE IN
            withAnimation(.easeOut(duration: 1.0)) {
                opacity = 1
            }

            // ⏭️ MOVE TO HOME
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                showHome = true
            }
        }
    }
}

