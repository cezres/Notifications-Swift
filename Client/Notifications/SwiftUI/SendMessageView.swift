//
//  SendMessageView.swift
//  Notifications
//
//  Created by azusa on 2021/11/4.
//

import SwiftUI

struct SendMessageView: View {
    @State var title: String = ""
    @State var message: String = ""
    @State var custom: [MessageBodyKeyValueView] = [
        .init(index: 0)
    ]
    
    @State var key: String = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                TextField("Message", text: $message)
            } header: {
                Text("Message")
            }
            
            Section {
                ForEach(custom) {
                    $0
                }
                Button("Add") {
                    custom.append(.init(index: custom.count))
                }
            } header: {
                Text("Body")
            }
            
            Section {
                Button("Key") {
                    
                }.foregroundColor(.black)
            } header: {
                Text("Key")
            }

            Section {
                Button("Send") {
                    print("""
                    Title: \(title)
                    Message: \(message)
                    Body:
                    \(custom.map { "\tKey: \($0.key) Value: \($0.value)" }.joined(separator: "\n"))
                    Key: \(key)
                    """)
                    UIApplication.shared.windows.last?.endEditing(true)
                }
            }
        }.navigationTitle("Send Message")
    }
}

struct SendMessageView_Previews: PreviewProvider {
    static var previews: some View {
        SendMessageView()
    }
}

struct MessageBodyKeyValueView: View, Identifiable {
    var id: Int {
        index
    }
    
    let index: Int
    @State var key: String = ""
    @State var value: String = ""
    
    var body: some View {
        TextField("Key \(index)", text: $key)
        TextField("Value \(index)", text: $value)
    }
}
