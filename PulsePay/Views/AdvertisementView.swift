import SwiftUI

struct AdvertisementView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            // Status dot (optional)
            HStack(spacing: 6) {
                Circle()
                    .fill(AppColors.positive)
                    .frame(width: 6, height: 6)
            }

            Text("Advertisement")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(titleColor)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(sectionBackground)
        .cornerRadius(22)
    }
    
    private var titleColor: Color {
        .white
    }
    
    private var sectionBackground: Color {
        .black
    }
}

#Preview("Adaptive") {
    Group {
        // Light mode preview
        AdvertisementView()
            .padding()
            .background(AppColors.cardWhite)
            .environment(\.colorScheme, .light)
        
        // Dark mode preview
        ZStack {
            AppColors.darkBG.ignoresSafeArea()
            AdvertisementView()
                .padding()
        }
        .environment(\.colorScheme, .dark)
    }
}
