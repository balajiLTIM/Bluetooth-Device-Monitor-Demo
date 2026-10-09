//
//  BluetoothDevice.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import Foundation
import CoreBluetooth

struct BluetoothDevice: Identifiable {
    let id: UUID
    let name: String
    let rssi: Int
    var isConnected: Bool
    let peripheral: CBPeripheral
}
