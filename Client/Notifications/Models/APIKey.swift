//
//  Key.swift
//  Notifications
//
//  Created by azusa on 2021/11/4.
//

import Foundation

struct APIKey: Identifiable {
    let value: String
//    let tag: String
    
    var id: String {
        value
    }
}
