//
//  NotificationMessageView.swift
//  Notifications
//
//  Created by 翟泉 on 2022/7/13.
//

import SwiftUI

struct NotificationMessageView: View {
    
    @State var message: NotificationMessage
    
    var body: some View {
        Form {
            if let title = message.title {
                Section {
                    Text(title)
                } header: {
                    Text("Title")
                }
            }
            
            if let subtitle = message.subtitle {
                Section {
                    Text(subtitle)
                } header: {
                    Text("SubTitle")
                }
            }
            
            if let body = message.body {
                Section {
                    Text(body)
                } header: {
                    Text("Body")
                }
            }
            
            Section {
                Text(message.dateString)
            } header: {
                Text("Date")
            }
            
            Section {
                Text(message.identifier)
            } header: {
                Text("identifier")
            }
        }
        .navigationTitle("")
        .toolbar(.automatic, in: .navigationBar)
//        .toolbar(.hidden, in: .tabBar)
    }
}

struct NotificationMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationMessageView(message: .init(title: "222", subtitle: "222", identifier: UUID().uuidString, date: .init()))
    }
}
