//
//  LiveUsageView.swift
//  PulsePay
//
//  Created by Anindya Mukhopadhyay on 01/01/26.
//

import SwiftUI

struct LiveUsageView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "waveform.path.ecg")
                    .font(.system(size: 64))
                    .foregroundColor(.green)

                Text("Live Usage")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                Text("Real-time usage metrics will appear here")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Live Usage")
        .navigationBarTitleDisplayMode(.inline)
    }
}
