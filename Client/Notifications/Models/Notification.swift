//
//  Notification.swift
//  Notifications
//
//  Created by azusa on 2021/11/4.
//

import Foundation

struct Message {
    let title: String
    let message: String
    let date: Date
}

extension Message: Identifiable {
    var id: String {
        title + message + date.description
    }
}
