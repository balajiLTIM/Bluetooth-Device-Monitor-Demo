//
//  AppCoordinator.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import SwiftUI
import Combine

@MainActor
final class AppCoordinator: ObservableObject {

    @Published var path = NavigationPath()

    func showDeviceList() {
        path.append(AppRoute.deviceList)
    }

    func showBluetooth() {
        path.append(AppRoute.bluetooth)
    }

    func showDeviceDetail(_ device: Device) {
        path.append(AppRoute.deviceDetail(device))
    }
}
