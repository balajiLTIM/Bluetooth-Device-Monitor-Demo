//
//  ConnectionEvent.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 21/09/26.
//

import Foundation

struct ConnectionEvent: Identifiable {
    let id = UUID()
    let timestamp: Date
    let state: ConnectionStatus
}

extension ConnectionEvent {

    var stateDisplayName: String {
        switch state {
        case .disconnected:
            return "Disconnected"

        case .connected:
            return "Connected"

        case .connecting:
            return "Connecting"

        case .scanning:
            return "Scanning"

        case .failed:
            return "Failed"
        }
    }
}
