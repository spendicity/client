//
//  AlertRow.swift
//  PulsePay
//
//  Created by Anindya Mukhopadhyay on 01/01/26.
//

import SwiftUI

struct AlertRow: View {

    let alert: AlertsView.AlertItem

    var body: some View {
        HStack(alignment: .top, spacing: 14) {

            Image(systemName: alert.type.icon)
                .foregroundColor(alert.type.color)
                .font(.title2)

            VStack(alignment: .leading, spacing: 6) {
                Text(alert.title)
                    .foregroundColor(AppColors.textOnDark)
                    .font(.headline)

                Text(alert.message)
                    .foregroundColor(AppColors.textMutedOnDark)
                    .font(.caption)

                Text(alert.time)
                    .foregroundColor(AppColors.textMutedOnDark.opacity(0.7))
                    .font(.caption2)
            }

            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.06))
        .cornerRadius(16)
    }
}
