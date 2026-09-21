//
//  Device.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import Foundation

struct Device: Identifiable, Hashable {
    let id: UUID
    let name: String
    let batteryLevel: Int
    let isConnected: Bool
}
