//
//  AppRoute.swift
//  BLEDeviceMonitorDemo
//
//  Created by Balaji Nagaraj on 18/09/26.
//

import Foundation

enum AppRoute: Hashable {
    case deviceList
    case deviceDetail(Device)
    case bluetooth
}
