//
//  NotificationMessage.swift
//  Notifications
//
//  Created by 翟泉 on 2022/7/13.
//

import Foundation
import UserNotifications

struct NotificationMessage: Hashable {
    
    var title: String?
    
    var subtitle: String?
    
    var body: String?
    
    let identifier: String
    
    let date: Date
}

extension NotificationMessage: Identifiable, Equatable {
    var id: String {
        identifier
    }
}

extension NotificationMessage {
    var dateString: String {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        return dataFormatter.string(from: date)
    }
}

extension UNNotification {
    var toMessage: NotificationMessage {
        .init(
            title: request.content.title,
            subtitle: request.content.subtitle,
            body: request.content.body,
            identifier: request.identifier,
            date: date
        )
    }
}
