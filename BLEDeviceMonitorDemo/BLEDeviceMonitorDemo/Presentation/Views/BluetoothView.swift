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
                .font(.headline)

            Text(stateText)
                .font(.title3)
                .fontWeight(.semibold)

            Button("Scan") {
                bluetoothManager.startScan()
            }

            Button("Connect") {
                bluetoothManager.connect()
            }

            Button("Disconnect") {
                bluetoothManager.disconnect()
            }

            Divider()

            NavigationLink {
                ConnectionHistoryView(
                    events: bluetoothManager.history
                )
            } label: {
                Text("View History")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                    )
            }
        }
        .padding()
        .navigationTitle("BLE Simulator")
    }

    private var stateText: String {

        switch bluetoothManager.state {
            
        case .scanning:
            return "Scanning"

        case .connecting:
            return "Connecting"

        case .connected:
            return "Connected"
            
        case .disconnected:
            return "Disconnected"

        case .failed:
            return "Failed"
        }
    }
}

#Preview {
    NavigationStack {
        BluetoothView()
    }
}
