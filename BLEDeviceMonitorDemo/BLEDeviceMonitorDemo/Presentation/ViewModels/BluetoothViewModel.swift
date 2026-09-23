//
//  BluetoothViewModel.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 30/09/26.
//

import Foundation
import Combine

@MainActor
final class BluetoothViewModel: ObservableObject {
    
    @Published private(set) var state: ConnectionStatus
    @Published private(set) var history: [ConnectionEvent]
    
    private let bluetoothManager: BluetoothManager
    private var cancellables = Set<AnyCancellable>()
    
    init(bluetoothManager: BluetoothManager) {
        self.bluetoothManager = bluetoothManager
        self.state = bluetoothManager.state
        self.history = bluetoothManager.history
        
        observeBluetoothManager()
    }
    
    convenience init() {
        self.init(bluetoothManager: BluetoothManager())
    }
    
    func startScan() {
        bluetoothManager.startScan()
    }
    
    func connect() {
        bluetoothManager.connect()
    }
    
    func disconnect() {
        bluetoothManager.disconnect()
    }
    
    private func observeBluetoothManager() {
        bluetoothManager.$state.sink { [weak self] newState in
            self?.state = newState
        }
        .store(in: &cancellables)
        
        bluetoothManager.$history.sink { [weak self] newHistory in
            self?.history = newHistory
        }
        .store(in: &cancellables)
    }
}
