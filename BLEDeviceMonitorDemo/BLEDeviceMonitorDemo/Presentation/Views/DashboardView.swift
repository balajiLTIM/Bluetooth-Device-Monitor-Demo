import SwiftUI

@MainActor
struct DashboardView: View {
    
    @StateObject private var viewModel = DashboardViewModel(coreBluetoothManager: CoreBluetoothManager())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack(spacing: 24) {
                    
                    Text("BLE Device Monitor")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    HStack {
                        Picker("Device Source", selection: $viewModel.selectedSource) {
                            Text("Mock")
                                .tag(DeviceSource.mock)
                            
                            Text("Real BLE")
                                .tag(DeviceSource.bluetooth)
                        }
                        .pickerStyle(.segmented)
                        .onChange(of: viewModel.selectedSource) { _, newValue in
                            
                            switch newValue {
                                
                            case .mock:
                                viewModel.loadMockData()
                                
                            case .bluetooth:
                                viewModel.switchToBluetooth()
                            }
                        }
                    }
                    
                    HStack(spacing: 16) {
                        
                        DashboardCardView(
                            title: "Total Devices",
                            value: "\(viewModel.totalDevices)",
                            color: .blue
                        )
                        
                        DashboardCardView(
                            title: "Connected",
                            value: "\(viewModel.connectedDevices)",
                            color: .green
                        )
                    }
                    
                    DashboardCardView(
                        title: "Disconnected",
                        value: "\(viewModel.disconnectedDevices)",
                        color: .red
                    )
                    
                    NavigationLink {
                        BluetoothDevicesView()
                    } label: {
                        Text("Nearby BLE Devices")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundStyle(.white)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 12)
                            )
                    }
                    
                    NavigationLink {
                        BluetoothView()
                    } label: {
                        Text("BLE Simulator")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundStyle(.white)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 12)
                            )
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Dashboard")
        }
    }
}

#Preview {
    DashboardView()
}

