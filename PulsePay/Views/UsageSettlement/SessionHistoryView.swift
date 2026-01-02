//
//  SessionHistoryView.swift
//  PulsePay
//
//  Created by Anindya Mukhopadhyay on 01/01/26.
//

import SwiftUI

struct SessionHistoryView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "clock.arrow.circlepath")
                    .font(.system(size: 64))
                    .foregroundColor(.orange)

                Text("Session History")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                Text("Past streaming sessions will be listed here")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Session History")
        .navigationBarTitleDisplayMode(.inline)
    }
}
