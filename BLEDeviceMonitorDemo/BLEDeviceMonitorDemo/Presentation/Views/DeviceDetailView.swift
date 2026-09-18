//
//  DeviceDetailView.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import SwiftUI

struct DeviceDetailView: View {

    let device: Device

    var body: some View {
        Form {
            Section("Device Information") {
                Text(device.name)
                Text(device.isConnected ? "Connected" : "Disconnected")
                Text("Battery: \(device.batteryLevel)%")
            }
        }
        .navigationTitle("Device Details")
    }
}

#Preview {
    NavigationStack {
        DeviceDetailView(
            device: Device(
                id: UUID(),
                name: "BLE Device 1",
                batteryLevel: 85,
                isConnected: true
            )
        )
    }
}
