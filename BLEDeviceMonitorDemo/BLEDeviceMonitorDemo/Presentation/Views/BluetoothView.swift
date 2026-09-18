//
//  BluetoothView.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import SwiftUI

struct BluetoothView: View {

    @StateObject private var bluetoothManager = BluetoothManager()

    var body: some View {

        VStack(spacing: 20) {
            Text("Bluetooth State")
            
            Text(stateText)

            Button("Scan") {
                bluetoothManager.startScan()
            }

            Button("Connect") {
                bluetoothManager.connect()
            }

            Button("Disconnect") {
                bluetoothManager.disconnect()
            }
        }
        .navigationTitle("BLE Simulator")
    }

    private var stateText: String {

        switch bluetoothManager.state {
        case .idle:
            return "Idle"

        case .scanning:
            return "Scanning"

        case .connecting:
            return "Connecting"

        case .connected:
            return "Connected"

        case .disconnected:
            return "Disconnected"

        case .failed(let error):
            return error
        }
    }
}
