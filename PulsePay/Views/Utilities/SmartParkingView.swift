//
//  SmartParkingView.swift
//  PulsePay
//
//  Created by Anindya Mukhopadhyay on 01/01/26.
//

import SwiftUI

struct SmartParkingView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "parkingsign.circle.fill")
                    .font(.system(size: 64))
                    .foregroundColor(.orange)

                Text("Smart Parking")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                Text("Charged only while parked")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Smart Parking")
        .navigationBarTitleDisplayMode(.inline)
    }
}
