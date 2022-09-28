//
//  String+MD5.swift
//  Notifications
//
//  Created by 翟泉 on 2022/7/14.
//

import Foundation
import CryptoKit

extension String {
    var md5: String {
        var md5 = Insecure.MD5()
        if let data = data(using: .utf8) {
            md5.update(data: data)
        }
        return Data(md5.finalize()).toHexString
    }
}
