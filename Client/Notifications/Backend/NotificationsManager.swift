//
//  NotificationsManager.swift
//  Notifications
//
//  Created by 翟泉 on 2022/7/21.
//

import Foundation
import UserNotifications

class NotificationsManager: ObservableObject {
    
    static let shared = NotificationsManager()
    
    @Published var notifications: [NotificationMessage] = []
    
    func loadNotifications() async {
        await MainActor.run(body: {
            self.notifications = [
                .init(title: "zzzz", identifier: "zzzz", date: .init()),
                .init(title: "yyyy", identifier: "CE865B88-C655-478E-8CEB-9DFF42CB9EDA", date: .init(timeIntervalSince1970: 1658389371.783833)),
                .init(title: "xxxx", identifier: "xxxx", date: .init().addingTimeInterval(-360000)),
            ]
        })
    }
    
    func mergeNotifications(_ notifications: [UNNotification]) async {
        var deliveredIndex = 0
        var localIndex = 0
        
        var localNotifications = self.notifications
        
        while deliveredIndex < notifications.count {
            
            let notification = notifications[deliveredIndex]
            
            if localIndex < localNotifications.count {
                let localNotification = localNotifications[localIndex]
                
                if localNotification.date <= notification.date {
                    if localNotification.identifier != notification.request.identifier {
                        localNotifications.insert(notification.toMessage, at: localIndex)
                    }
                    deliveredIndex += 1
                }
            } else {
                localNotifications.insert(notification.toMessage, at: localIndex)
                deliveredIndex += 1
            }
            
            localIndex += 1
        }
        
        print(localNotifications.map { $0.date.timeIntervalSince1970 })
        
        await MainActor.run { [localNotifications] in
            self.notifications = localNotifications
        }
    }
}
