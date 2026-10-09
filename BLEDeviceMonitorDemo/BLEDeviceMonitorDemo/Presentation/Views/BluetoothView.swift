//
//  BluetoothView.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import SwiftUI

@MainActor
struct BluetoothView: View {

    @StateObject private var viewModel = BluetoothViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                stateCard
                actionButtons
                Divider()
                historyNavigationButton
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("BLE Simulator")
        .navigationBarTitleDisplayMode(.large)
    }

    // MARK: - State Card

    private var stateCard: some View {
        VStack(spacing: 16) {

            Image(systemName: stateIcon)
                .font(.system(size: 46, weight: .semibold))
                .foregroundStyle(stateColor)
                .symbolEffect(
                    .pulse,
                    options: .repeating,
                    isActive: shouldAnimateStateIcon
                )
                .accessibilityHidden(true)

            Text("Bluetooth State")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text(stateText)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(stateColor)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 28)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(colors: [
                        stateColor.opacity(0.18),
                        stateColor.opacity(0.05)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                                  )
                )
        )
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    stateColor.opacity(0.25),
                    lineWidth: 1
                )
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Current Bluetooth State")
        .accessibilityValue(stateText)
    }

    // MARK: - Action Buttons

    private var actionButtons: some View {
        VStack(spacing: 14) {

            bluetoothActionButton(
                title: "Scan for Devices",
                systemImage: "dot.radiowaves.left.and.right",
                colour: .blue,
                isDisabled: viewModel.state == .scanning
            ) {
                viewModel.startScan()
            }
            .accessibilityHint(
                "Starts scanning for nearby Bluetooth devices"
            )

            bluetoothActionButton(
                title: "Connect",
                systemImage: "link",
                colour: .green,
                isDisabled:
                    viewModel.state == .connected ||
                    viewModel.state == .connecting
            ) {
                viewModel.connect()
            }
            .accessibilityHint(
                "Simulates connecting to a Bluetooth device"
            )

            bluetoothActionButton(
                title: "Disconnect",
                systemImage: "link.badge.minus",
                colour: .red,
                isDisabled: viewModel.state != .connected
            ) {
                viewModel.disconnect()
            }
            .accessibilityHint(
                "Disconnects the currently connected Bluetooth device"
            )
        }
    }

    private func bluetoothActionButton(title: String, systemImage: String, colour: Color, isDisabled: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Label(title, systemImage: systemImage)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 14))
        .tint(colour)
        .disabled(isDisabled)
        .opacity(isDisabled ? 0.55 : 1)
        .accessibilityLabel(title)
    }

    // MARK: - History Navigation

    private var historyNavigationButton: some View {
        NavigationLink {
            ConnectionHistoryView(
                events: viewModel.history
            )
        } label: {
            HStack(spacing: 12) {

                Image(systemName: "clock.arrow.circlepath")
                    .font(.title3)

                VStack(alignment: .leading, spacing: 3) {

                    Text("Connection History")
                        .font(.headline)

                    Text(historySubtitle)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.85))
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.indigo)
            .foregroundStyle(.white)
            .clipShape(
                RoundedRectangle(cornerRadius: 14)
            )
        }
        .accessibilityLabel("View Connection History")
        .accessibilityValue(historySubtitle)
        .accessibilityHint(
            "Shows previous Bluetooth state changes"
        )
    }

    // MARK: - State Presentation

    private var stateText: String {
        switch viewModel.state {
        case .scanning:
            return "Scanning"

        case .connecting:
            return "Connecting"

        case .connected:
            return "Connected"

        case .disconnected:
            return "Disconnected"

        case .failed:
            return "Failed"
        }
    }

    private var stateIcon: String {
        switch viewModel.state {
        case .scanning:
            return "dot.radiowaves.left.and.right"

        case .connecting:
            return "antenna.radiowaves.left.and.right"

        case .connected:
            return "checkmark.circle.fill"

        case .disconnected:
            return "xmark.circle.fill"

        case .failed:
            return "exclamationmark.triangle.fill"
        }
    }

    private var stateColor: Color {
        switch viewModel.state {
        case .scanning:
            return .orange

        case .connecting:
            return .blue

        case .connected:
            return .green

        case .disconnected:
            return .red

        case .failed:
            return .red
        }
    }

    private var shouldAnimateStateIcon: Bool {
        switch viewModel.state {
        case .scanning, .connecting:
            return true

        case .connected, .disconnected, .failed:
            return false
        }
    }

    private var historySubtitle: String {
        let count = viewModel.history.count

        if count == 0 {
            return "No connection events"
        }

        if count == 1 {
            return "1 connection event"
        }

        return "\(count) connection events"
    }
}

#Preview {
    NavigationStack {
        BluetoothView()
    }
}
