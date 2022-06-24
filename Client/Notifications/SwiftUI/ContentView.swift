//
//  ContentView.swift
//  Notifications
//
//  Created by azusa on 2021/11/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NotificationsView()
            SettingsView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
