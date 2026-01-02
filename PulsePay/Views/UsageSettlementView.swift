//
//  UsageSettlementView.swift
//  PulsePay
//
//  Created by Anindya Mukhopadhyay on 01/01/26.
//

import SwiftUI

struct UsageSettlementView: View {

    let items: [DashboardItem]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            HStack {
                Text("Usage & Settlement")
                    .font(.title3.bold())
                    .foregroundColor(.white)

                Spacer()

                Text("View All")
                    .foregroundColor(.purple)
            }

            LazyVGrid(
                columns: Array(repeating: .init(.flexible()), count: 4),
                spacing: 16
            ) {
                ForEach(items) { item in
                    BillIcon(item: item)
                }
            }
        }
    }
}
