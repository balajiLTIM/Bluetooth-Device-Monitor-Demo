//
//  CoreBluetoothManager.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 23/09/26.
//

import Foundation
import CoreBluetooth

final class CoreBluetoothManager: NSObject, CBCentralManagerDelegate {

    private var centralManager: CBCentralManager?

    override init() {
        super.init()

        centralManager = CBCentralManager(
            delegate: self,
            queue: nil
        )
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {

        switch central.state {

        case .poweredOn:
            print("Bluetooth Powered On")

        case .poweredOff:
            print("Bluetooth Powered Off")

        default:
            break
        }
    }
}

