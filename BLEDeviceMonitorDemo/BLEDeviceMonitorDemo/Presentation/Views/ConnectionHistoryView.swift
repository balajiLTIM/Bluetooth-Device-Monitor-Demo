//
//  ConnectionHistoryView.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 21/09/26.
//

import SwiftUI
import Combine

struct ConnectionHistoryView: View {

    let events: [ConnectionEvent]

    var body: some View {

        List(events) { event in
            VStack(alignment: .leading) {
                
                Text(event.stateDisplayName)
                
                Text(event.timestamp.formatted())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("Connection History")
    }
}

