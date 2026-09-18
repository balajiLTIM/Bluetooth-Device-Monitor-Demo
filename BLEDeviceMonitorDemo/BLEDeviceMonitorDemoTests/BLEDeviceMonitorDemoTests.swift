//
//  BLEDeviceMonitorDemoTests.swift
//  BLEDeviceMonitorDemoTests
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import Testing
import XCTest
@testable import BLEDeviceMonitorDemo

struct BLEDeviceMonitorDemoTests {

    func testFetchDevicesReturnsData() async throws {

        let repository = MockDeviceRepository()
        let useCase = GetDevicesUseCase(
            repository: repository
        )

        let devices = try await useCase.execute()

        XCTAssertFalse(devices.isEmpty)
    }
}
