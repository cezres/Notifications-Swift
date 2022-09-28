//
//  NotificationsView.swift
//  Notifications
//
//  Created by 翟泉 on 2022/7/13.
//

import SwiftUI

struct NotificationsView: View {
    
    @StateObject var pathManager = NavigationPathManager()
    
    @StateObject var notificationsManager = NotificationsManager.shared
    
    var body: some View {
        NavigationStack(path: $pathManager.path) {
            List(notificationsManager.notifications) { message in
                NavigationLink(value: message) {
                    VStack(alignment: .leading) {
                        if let title = message.title {
                            Text(title)
                                .font(.headline)
                        }
                        if let subtitle = message.subtitle {
                            Text(subtitle)
                                .font(.subheadline)
                        } else if let body = message.body {
                            Text(body)
                                .font(.body)
                        }
                        Text(message.dateString)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationDestination(for: NotificationMessage.self) { message in
                NotificationMessageView(message: message)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Notifications")
            .toolbarBackground(.automatic, in: .navigationBar)
            .toolbar(.visible, in: .tabBar)
        }
        .environmentObject(pathManager)
        .task {
            
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
