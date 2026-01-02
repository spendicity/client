//
//  WorkPodsView.swift
//  PulsePay
//
//  Created by Anindya Mukhopadhyay on 01/01/26.
//

import SwiftUI

struct WorkPodsView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "building.2.fill")
                    .font(.system(size: 64))
                    .foregroundColor(.purple)

                Text("Work Pods")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                Text("Pay per minute workspace access")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Work Pods")
        .navigationBarTitleDisplayMode(.inline)
    }
}
