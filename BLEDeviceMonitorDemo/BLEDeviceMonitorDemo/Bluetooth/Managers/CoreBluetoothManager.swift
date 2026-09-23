//
//  CoreBluetoothManager.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 23/09/26.
//

import Foundation
import CoreBluetooth
import Combine

@MainActor
final class CoreBluetoothManager: NSObject, ObservableObject {

    @Published private(set) var discoveredDevices: [BluetoothDevice] = []
    @Published private(set) var bluetoothState: CBManagerState = .unknown
    private var peripherals: [CBPeripheral] = []
    
    private var centralManager: CBCentralManager!

    override init() {
        super.init()

        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    func startScanning() {
        guard centralManager.state == .poweredOn else {
            return
        }

        discoveredDevices.removeAll()
        centralManager.scanForPeripherals(withServices: nil,
                                          options: [CBCentralManagerScanOptionAllowDuplicatesKey: false])
    }

    func stopScanning() {
        centralManager.stopScan()
    }
}

extension CoreBluetoothManager: CBCentralManagerDelegate {

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        bluetoothState = central.state
        if central.state == .poweredOn {
            startScanning()
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
        
        let advertisedName = advertisementData[CBAdvertisementDataLocalNameKey] as? String
        let name = advertisedName ?? peripheral.name ?? "Unknown BLE Device"

        peripherals.append(peripheral)
        
        let device = BluetoothDevice(id: peripheral.identifier,
                                     name: name,
                                     rssi: RSSI.intValue,
                                     isConnected: peripheral.state == .connected,
                                     peripheral: peripheral
        )

        guard !discoveredDevices.contains(where: { $0.id == device.id }) else {
            return
        }
        discoveredDevices.append(device)
    }
    
    func connect(_ peripheral: CBPeripheral) {
        centralManager.connect(peripheral, options: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {

        if let index = discoveredDevices.firstIndex( where: {
            $0.id == peripheral.identifier
        }) {
            discoveredDevices[index].isConnected = true
        }
    }
}
