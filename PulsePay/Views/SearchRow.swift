//
//  SearchRow.swift
//  PulsePay
//
//  Created by Anindya Mukhopadhyay on 01/01/26.
//

import SwiftUI

struct SearchRow: View {

    let title: String

    var body: some View {
        HStack(spacing: 14) {

            Circle()
                .fill(AppColors.accentBlue.opacity(0.2))
                .frame(width: 40, height: 40)
                .overlay(
                    Image(systemName: "arrow.up.right")
                        .foregroundColor(AppColors.accentBlue)
                )

            Text(title)
                .foregroundColor(AppColors.textOnDark)
                .font(.headline)

            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(14)
    }
}
