//
//  NotificationsView.swift
//  Notifications
//
//  Created by azusa on 2021/11/4.
//

import SwiftUI

struct NotificationsView: View {
    
    @State var messages: [Message] = [
        .init(title: "1111", message: "218738127321jhbwqj", date: .init()),
        .init(title: "2222", message: "218738127321jhbwqj", date: .init()),
        .init(title: "3333", message: "218738127321jhbwqj", date: .init()),
        .init(title: "4444", message: "218738127321jhbwqj", date: .init()),
        .init(title: "5555", message: "218738127321jhbwqj", date: .init()),
        .init(title: "6666", message: "218738127321jhbwqj", date: .init()),
        .init(title: "7777", message: "218738127321jhbwqj", date: .init()),
        .init(title: "8888", message: "218738127321jhbwqj", date: .init()),
        .init(title: "9999", message: "218738127321jhbwqj", date: .init()),
        .init(title: "10101010", message: "218738127321jhbwqj", date: .init()),
        .init(title: "11111111", message: "218738127321jhbwqj", date: .init()),
        .init(title: "12121212", message: "218738127321jhbwqj", date: .init()),
    ]
    
    var body: some View {
        NavigationView {
//            Text("消息列表")
//                .navigationTitle("消息列表")
            Form {
                Section {
                    ForEach(messages) { message in
                        NavigationLink {
                            //
                        } label: {
                            VStack {
                                HStack {
                                    Text(message.title).font(.headline)
                                    Spacer()
                                }
                                HStack {
                                    Text(message.message).font(.footnote)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }.navigationTitle("Messages")
        }.tabItem {
//            Image(systemName: "text.bubble.fill")
            Image(systemName: "bell.fill")
            Text("Messages")
        }
    }
    
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
