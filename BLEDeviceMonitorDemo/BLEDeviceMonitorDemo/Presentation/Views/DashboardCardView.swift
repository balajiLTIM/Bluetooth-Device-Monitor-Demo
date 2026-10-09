//
//  DashboardCardView.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import SwiftUI

struct DashboardCardView: View {
    
    let title: String
    let value: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.headline)
            Text(value)
                .font(.system(size: 32, weight: .bold))
                .foregroundStyle(color)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                    colors: [
                        color.opacity(0.20),
                        color.opacity(0.05)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                    )
                )
        )
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(color.opacity(0.2),lineWidth: 1)
        )
    }
}

#Preview {
    DashboardCardView(
        title: "Connected",
        value: "3",
        color: .green
    )
}
