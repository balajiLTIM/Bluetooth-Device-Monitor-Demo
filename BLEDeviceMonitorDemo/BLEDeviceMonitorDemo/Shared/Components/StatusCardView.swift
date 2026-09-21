//
//  StatusCardView.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 21/09/26.
//

import SwiftUI

struct StatusCardView: View {

    let title: String
    let value: String
    let color: Color

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)

            Text(value)
                .font(.title)
                .bold()
                .foregroundStyle(color)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.gray.opacity(0.1))
        .clipShape(
            RoundedRectangle(cornerRadius: 12)
        )
    }
}
