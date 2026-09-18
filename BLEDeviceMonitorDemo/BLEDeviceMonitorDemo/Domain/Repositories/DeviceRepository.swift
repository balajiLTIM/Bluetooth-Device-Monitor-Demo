//
//  DeviceRepository.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import Foundation

protocol DeviceRepository {
    func fetchDevices() async throws -> [Device]
}
