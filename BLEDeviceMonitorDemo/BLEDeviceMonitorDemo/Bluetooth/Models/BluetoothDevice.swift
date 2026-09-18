//
//  BluetoothDevice.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import Foundation

struct BluetoothDevice: Identifiable {
    let id: UUID
    let name: String
    let rssi: Int
}
