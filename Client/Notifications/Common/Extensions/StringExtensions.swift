//
//  StringExtensions.swift
//  Notifications
//
//  Created by azusa on 2021/11/4.
//

import Foundation
import CommonCrypto
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
