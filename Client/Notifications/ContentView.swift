//
//  ContentView.swift
//  Notifications
//
//  Created by 翟泉 on 2022/7/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NotificationsView()
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("Notifications")
                }
            SettingsView()
                .navigationTitle("Settings")
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
