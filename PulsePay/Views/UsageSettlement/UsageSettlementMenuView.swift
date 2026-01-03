// UsageSettlementMenuView.swift
import SwiftUI

struct UsageSettlementMenuView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            List {
                Section {
                    NavigationLink {
                        LiveUsageView()
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "waveform.path.ecg")
                                .foregroundColor(.green)
                            Text("Live Usage")
                                .foregroundColor(.white)
                        }
                    }

                    NavigationLink {
                        LiveBalanceView()
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "indianrupeesign.circle.fill")
                                .foregroundColor(.purple)
                            Text("Live Balance")
                                .foregroundColor(.white)
                        }
                    }

                    NavigationLink {
                        SessionHistoryView()
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "clock.arrow.circlepath")
                                .foregroundColor(.orange)
                            Text("Session History")
                                .foregroundColor(.white)
                        }
                    }

                    NavigationLink {
                        AutoSettlementView()
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .foregroundColor(.blue)
                            Text("Auto Settlement")
                                .foregroundColor(.white)
                        }
                    }
                }
                .listRowBackground(Color.white.opacity(0.08))
            }
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Usage & Settlement")
        .navigationBarTitleDisplayMode(.inline)
    }
}
