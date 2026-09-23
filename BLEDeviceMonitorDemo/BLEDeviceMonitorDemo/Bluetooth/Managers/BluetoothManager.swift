//
//  BluetoothManager.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import SwiftUI
import Combine

@MainActor
final class BluetoothManager: ObservableObject {

    @Published var state: ConnectionStatus = .scanning
    @Published var history: [ConnectionEvent] = []
    
    func startScan() {
        state = .scanning
        history.append(ConnectionEvent(timestamp: Date(),state: .scanning))
    }

    func connect() {
        state = .connecting

        Task {
            try? await Task.sleep(for: .seconds(2))
            state = .connected
        }
    }

    func disconnect() {
        state = .disconnected
    }
}
