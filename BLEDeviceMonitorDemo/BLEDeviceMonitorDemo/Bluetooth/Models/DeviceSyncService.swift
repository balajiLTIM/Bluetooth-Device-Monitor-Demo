//
//  DeviceSyncService.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 22/09/26.
//

import Foundation

final class DeviceSyncService {

    func fetchDevices() async throws -> [Device] {

        try await Task.sleep(for: .seconds(1))

        return [
            Device(
                id: UUID(),
                name: "BLE Device A",
                batteryLevel: 90,
                isConnected: true
            )
        ]
    }
}
