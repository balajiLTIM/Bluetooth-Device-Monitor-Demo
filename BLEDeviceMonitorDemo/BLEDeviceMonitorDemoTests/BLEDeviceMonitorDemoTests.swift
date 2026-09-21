//
//  BLEDeviceMonitorDemoTests.swift
//  BLEDeviceMonitorDemoTests
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import XCTest
@testable import BLEDeviceMonitorDemo

final class BluetoothManagerTests: XCTestCase {

    @MainActor
    func testStartScanChangesState() {

        let manager = BluetoothManager()

        manager.startScan()

        XCTAssertEqual(
            manager.state,
            .scanning
        )
    }
}
