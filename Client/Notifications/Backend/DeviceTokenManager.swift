//
//  DeviceTokenManager.swift
//  Notifications
//
//  Created by 翟泉 on 2022/7/13.
//

import Foundation

class DeviceTokenManager: ObservableObject {
    
    static let shared = DeviceTokenManager()
    
    @Published var deviceToken: String?
    
    @Published var error: Error?
    
    private init(deviceToken: String? = nil, error: Error? = nil) {
        self.deviceToken = deviceToken
        self.error = error
    }
}
