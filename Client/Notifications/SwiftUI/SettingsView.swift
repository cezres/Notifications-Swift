//
//  SettingsView.swift
//  Notifications
//
//  Created by azusa on 2021/11/4.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink {
                        KeysView()
                    } label: {
                        NavigationLinkLabel(systemName: "key.fill", text: "API Keys")
                    }
                    NavigationLink {
                        SendMessageView()
                    } label: {
                        NavigationLinkLabel(systemName: "plus.bubble.fill", text: "Send Message")
                    }
                } header: {
                    Text("Key")
                }
                
                Section {
                    NavigationLink {
                        
                    } label: {
                        NavigationLinkLabel(systemName: "server.rack", text: "Category") // circle.grid.cross.fill
                    }

                    NavigationLink {
                        AppIconsView()
                    } label: {
                        NavigationLinkLabel(systemName: "gear", text: "App Icons")
                    }
                }
            }.navigationTitle("Settings")
        }.tabItem {
            Image(systemName: "gearshape.fill")
            Text("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

struct NavigationLinkLabel: View {
    
    @State var systemName: String
    @State var text: String
    
    var body: some View {
        HStack {
            Image(systemName: systemName)
        }.frame(width: 34, alignment: .center)
        Text(text)
    }
    
}
