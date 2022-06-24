//
//  DataExtensions.swift
//  Notifications
//
//  Created by azusa on 2021/11/4.
//

import Foundation

extension Data {
    var toHexString: String {
        reduce("") { $0 + String(format: "%02x", $1) }
    }
}
