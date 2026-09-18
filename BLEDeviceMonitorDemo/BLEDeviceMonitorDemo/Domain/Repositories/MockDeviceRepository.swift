//
//  MockDeviceRepository.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import Foundation

final class MockDeviceRepository: DeviceRepository {

    func fetchDevices() async throws -> [Device] {
        [
            Device(
                id: UUID(),
                name: "BLE Device A",
                batteryLevel: 85,
                isConnected: true
            ),
            Device(
                id: UUID(),
                name: "BLE Device B",
                batteryLevel: 60,
                isConnected: false
            )
        ]
    }
}
