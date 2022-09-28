//
//  NotificationsApp.swift
//  Notifications
//
//  Created by 翟泉 on 2022/7/12.
//

import SwiftUI
import UserNotifications

@main
struct NotificationsApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        UNUserNotificationCenter.current().delegate = self
        Task.detached {
            let status = try await UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound])
            print("UserNotifications - Authorization - \(status)")
            await UIApplication.shared.registerForRemoteNotifications()
            
            let pending = await UNUserNotificationCenter.current().pendingNotificationRequests()
            print(pending)
            
            await NotificationsManager.shared.loadNotifications()
            
            let deliveredNotifications = await UNUserNotificationCenter.current().deliveredNotifications()
            await NotificationsManager.shared.mergeNotifications(deliveredNotifications)
        }
        
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        DeviceTokenManager.shared.deviceToken = token
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async -> UIBackgroundFetchResult {
        print("\n\(#function):")
        print(userInfo)
        
        return .noData
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        DeviceTokenManager.shared.error = error
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        print(#function)
        print(response)
        print("从系统通知栏点击推送消息")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        print(#function)
        print(notification)
        
        Task.detached {
            await NotificationsManager.shared.mergeNotifications([notification])
        }
        
        return [.list, .badge, .banner, .sound]
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
        print(#function)
        if let notification = notification {
            print(notification)
        }
    }
}
