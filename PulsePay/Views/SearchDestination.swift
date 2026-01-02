//
//  SearchDestination.swift
//  PulsePay
//
//  Created by Anindya Mukhopadhyay on 01/01/26.
//

import SwiftUI

enum SearchDestination: String, CaseIterable, Identifiable {
    case evCharging = "EV Charging"
    case publicWiFi = "Public WiFi"
    case sessionHistory = "Session History"
    case liveUsage = "Live Usage"
    case autoSettlement = "Auto Settlement"
    case smartParking = "Smart Parking"

    var id: String { rawValue }

    @ViewBuilder
    var destinationView: some View {
        switch self {
        case .evCharging:
            EVChargingView()
        case .publicWiFi:
            PublicWiFiView()
        case .sessionHistory:
            SessionHistoryView()
        case .liveUsage:
            LiveUsageView()
        case .autoSettlement:
            AutoSettlementView()
        case .smartParking:
            SmartParkingView()
        }
    }
}
