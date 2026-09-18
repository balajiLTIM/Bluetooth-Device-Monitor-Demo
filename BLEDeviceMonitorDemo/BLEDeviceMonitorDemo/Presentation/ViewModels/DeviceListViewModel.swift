//
//  DeviceListViewModel.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import SwiftUI
import Combine

@MainActor
final class DeviceListViewModel: ObservableObject {

    @Published var devices: [Device] = []
    private let useCase: GetDevicesUseCase

    init(useCase: GetDevicesUseCase) {
        self.useCase = useCase
    }

    func loadDevices() async {
        do {
            devices = try await useCase.execute()
        } catch {
            print(error)
        }
    }
}
