//
//  DeviceRowView.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import SwiftUI

struct DeviceRowView: View {

    let device: Device

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(device.name)
                    .font(.headline)
                Text(device.isConnected ? "Connected" : "Disconnected")
                .font(.caption)
                .foregroundColor(.secondary)
            }
            Spacer()
            Circle()
                .fill(device.isConnected ? .green : .red)
                .frame(width: 12, height: 12)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    DeviceRowView(
        device: Device(
            id: UUID(),
            name: "BLE Device 1",
            batteryLevel: 80,
            isConnected: true
        )
    )
}
