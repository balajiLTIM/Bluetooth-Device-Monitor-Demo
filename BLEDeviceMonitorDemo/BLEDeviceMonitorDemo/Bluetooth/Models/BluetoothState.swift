//
//  BluetoothState.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import Foundation

enum BluetoothState {
    case idle
    case scanning
    case connecting
    case connected
    case disconnected
    case failed(String)
}
