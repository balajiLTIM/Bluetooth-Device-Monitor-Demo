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
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 2)
    }
}

#Preview {
    DashboardCardView(
        title: "Connected",
        value: "3",
        color: .green
    )
}
