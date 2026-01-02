//
//  AutoSettlementView.swift
//  PulsePay
//
//  Created by Anindya Mukhopadhyay on 01/01/26.
//

import SwiftUI

struct AutoSettlementView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "arrow.triangle.2.circlepath")
                    .font(.system(size: 64))
                    .foregroundColor(.blue)

                Text("Auto Settlement")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                Text("Automatic settlement configuration")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Auto Settlement")
        .navigationBarTitleDisplayMode(.inline)
    }
}
