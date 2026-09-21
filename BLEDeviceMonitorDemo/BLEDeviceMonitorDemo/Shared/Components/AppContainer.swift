//
//  AppContainer.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 21/09/26.
//

import Foundation

final class AppContainer {

    func makeDeviceRepository() -> DeviceRepository {
        MockDeviceRepository()
    }

    func makeGetDevicesUseCase() -> GetDevicesUseCase {
        GetDevicesUseCase(
            repository: makeDeviceRepository()
        )
    }

    func makeDeviceListViewModel() -> DeviceListViewModel {
        DeviceListViewModel(
            useCase: makeGetDevicesUseCase()
        )
    }
}
