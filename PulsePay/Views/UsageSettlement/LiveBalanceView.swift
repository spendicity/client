//
//  LiveBalanceView.swift
//  PulsePay
//
//  Created by Anindya Mukhopadhyay on 01/01/26.
//

import SwiftUI

struct LiveBalanceView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "indianrupeesign.circle.fill")
                    .font(.system(size: 64))
                    .foregroundColor(.purple)

                Text("Live Balance")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                Text("Current streaming balance overview")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Live Balance")
        .navigationBarTitleDisplayMode(.inline)
    }
}
