//
//  GetDevicesUseCase.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import Foundation

final class GetDevicesUseCase {

    private let repository: DeviceRepository

    init(repository: DeviceRepository) {
        self.repository = repository
    }

    func execute() async throws -> [Device] {
        try await repository.fetchDevices()
    }
}
