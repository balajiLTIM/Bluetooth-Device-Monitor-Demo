//
//  ConnectionStatus.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import Foundation

enum ConnectionStatus: Equatable {
    case scanning
    case connecting
    case connected
    case disconnected
    case failed

    var displayName: String {
        switch self {
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
