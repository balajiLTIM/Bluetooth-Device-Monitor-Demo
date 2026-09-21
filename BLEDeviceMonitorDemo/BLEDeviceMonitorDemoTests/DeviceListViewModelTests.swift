//
//  DeviceListViewModelTests.swift
//  BLEDeviceMonitorDemoTests
//
//  Created by Balaji Nagaraj on 21/09/26.
//

import XCTest
@testable import BLEDeviceMonitorDemo

final class DeviceListViewModelTests: XCTestCase {
    
    @MainActor
    func fetchDevicesReturnsDevices() async throws {
        
        let repository = MockDeviceRepository()
        
        let useCase = GetDevicesUseCase(
            repository: repository
        )
        
        let devices = try await useCase.execute()
        XCTAssert(devices.isEmpty)
        XCTAssert(devices.count == 2)
    }
}
