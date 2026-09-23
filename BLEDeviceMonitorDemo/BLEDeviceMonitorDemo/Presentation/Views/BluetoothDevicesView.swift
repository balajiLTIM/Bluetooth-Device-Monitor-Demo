//
//  BluetoothDevicesView.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 29/09/26.
//

import SwiftUI

struct BluetoothDevicesView: View {
    
    @StateObject private var manager = CoreBluetoothManager()
    
    var body: some View {
        
        List(manager.discoveredDevices) { device in
            HStack {
                Image(systemName: "dot.radiowaves.left.and.right")
                    .foregroundColor(.blue)
                VStack(alignment: .leading) {
                    Text(device.name)
                        .font(.headline)
                    Text("RSSI: \(device.rssi)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Button("Connect") {
                        manager.connect(device.peripheral)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .navigationTitle("Nearby BLE Devices")
        .task {
            manager.startScanning()
        }
    }
}
