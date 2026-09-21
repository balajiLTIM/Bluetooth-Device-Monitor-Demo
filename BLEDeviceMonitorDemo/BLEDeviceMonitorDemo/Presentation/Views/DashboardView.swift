import SwiftUI

struct DashboardView: View {

    let totalDevices = 5
    let connectedDevices = 3
    let disconnectedDevices = 2

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("BLE Device Monitor")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    HStack(spacing: 16) {
                        
                        DashboardCardView(
                            title: "Total Devices",
                            value: "\(totalDevices)",
                            color: .blue
                        )
                        
                        DashboardCardView(
                            title: "Connected",
                            value: "\(connectedDevices)",
                            color: .green
                        )
                    }
                    DashboardCardView(
                        title: "Disconnected",
                        value: "\(disconnectedDevices)",
                        color: .red
                    )
                    
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
                    .accessibilityLabel("Open Bluetooth Simulator")
                    .accessibilityHint("Navigates to Bluetooth simulator screen")
                    .padding(.top, 20)
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
