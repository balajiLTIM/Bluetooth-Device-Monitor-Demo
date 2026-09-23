//
//  DashboardViewModel.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 30/09/26.
//

import Foundation
import Combine
import CoreBluetooth

enum DeviceSource {
    case mock
    case bluetooth
}

@MainActor
final class DashboardViewModel: ObservableObject {
    
    @Published var totalDevices = 0
    @Published var connectedDevices = 0
    @Published var disconnectedDevices = 0
    
    @Published var selectedSource: DeviceSource = .mock
    
    private let coreBluetoothManager: CoreBluetoothManager
    private var cancellables = Set<AnyCancellable>()
    
    init(coreBluetoothManager: CoreBluetoothManager) {
        self.coreBluetoothManager = coreBluetoothManager
        
        loadMockData()
        observeBluetoothDevices()
    }
    
    func loadMockData() {
        totalDevices = 5
        connectedDevices = 3
        disconnectedDevices = 2
    }
    
    func switchToBluetooth() {
        selectedSource = .bluetooth
        if coreBluetoothManager.bluetoothState == .poweredOn {
            coreBluetoothManager.startScanning()
        }
        updateBluetoothCounts()
    }
    
    func switchToMock() {
        selectedSource = .mock
        loadMockData()
    }
    
    private func observeBluetoothDevices() {
        coreBluetoothManager.$discoveredDevices.sink { [weak self] _ in
            guard let self else { return }
            if self.selectedSource == .bluetooth {
                self.updateBluetoothCounts()
            }
        }
        .store(in: &cancellables)
    }
    
    private func updateBluetoothCounts() {
        
        let devices = coreBluetoothManager.discoveredDevices
        totalDevices = devices.count
        connectedDevices = devices.filter(\.isConnected).count
        disconnectedDevices = totalDevices - connectedDevices
    }
}
