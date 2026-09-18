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

    @Published var state: BluetoothState = .idle

    func startScan() {
        state = .scanning
    }

    func connect() {
        state = .connecting

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.state = .connected
        }
    }

    func disconnect() {
        state = .disconnected
    }
}
