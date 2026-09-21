//
//  RootView.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 21/09/26.
//

import Foundation
import SwiftUI

struct RootView: View {

    @StateObject private var coordinator = AppCoordinator()

    var body: some View {

        NavigationStack(path: $coordinator.path) {

            DashboardView()
                .navigationDestination(for: AppRoute.self) { route in

                    switch route {

                    case .deviceList:

                        let repository = MockDeviceRepository()

                        let useCase = GetDevicesUseCase(
                            repository: repository
                        )

                        let viewModel = DeviceListViewModel(
                            useCase: useCase
                        )

                        DeviceListView(
                            viewModel: viewModel
                        )

                    case .bluetooth:

                        BluetoothView()

                    case .deviceDetail(let device):

                        DeviceDetailView(
                            device: device
                        )
                    }
                }
        }
        .environmentObject(coordinator)
    }
}
