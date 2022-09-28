//
//  Data+Hex.swift
//  Notifications
//
//  Created by 翟泉 on 2022/7/14.
//

import Foundation

extension Data {
    var toHexString: String {
        reduce("") { $0 + String(format: "%02x", $1) }
    }
}
