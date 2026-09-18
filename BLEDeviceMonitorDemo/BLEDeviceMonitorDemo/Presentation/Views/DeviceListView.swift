//
//  DeviceListView.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import SwiftUI

struct DeviceListView: View {

    @StateObject private var viewModel: DeviceListViewModel

    init(viewModel: DeviceListViewModel) {
        _viewModel = StateObject(
            wrappedValue: viewModel
        )
    }

    var body: some View {
        List(viewModel.devices) { device in

            NavigationLink {
                DeviceDetailView(device: device)
            } label: {
                DeviceRowView(device: device)
            }

        }
        .navigationTitle("Devices")
        .task {
            await viewModel.loadDevices()
        }
    }
}

#Preview {
    let repository = MockDeviceRepository()
    let useCase = GetDevicesUseCase(repository: repository)
    let viewModel = DeviceListViewModel(useCase: useCase)

    NavigationStack {
        DeviceListView(viewModel: viewModel)
    }
}
