//
//  SettingsView.swift
//  Notifications
//
//  Created by 翟泉 on 2022/7/13.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var pathManager = NavigationPathManager()
    
    @StateObject var deviceTokenManager = DeviceTokenManager.shared
    
    @State var isPresentedCopyDeviceToken = false
    
    var body: some View {
        NavigationStack(path: $pathManager.path) {
            Form {
                Section {
                    if let deviceToken = deviceTokenManager.deviceToken {
                        Text(deviceToken)
                            .truncationMode(.middle)
                            .lineLimit(1)
                            .onTapGesture {
                                UIPasteboard.general.string = deviceToken
                                isPresentedCopyDeviceToken = true
                            }
                            .alert("已复制DeviceToken", isPresented: $isPresentedCopyDeviceToken) {
                                Text(deviceToken)
                            }
                    } else if let error = deviceTokenManager.error {
                        Text(error.localizedDescription)
                    } else {
                        Text("Null")
                    }
                } header: {
                    Text("DeviceToken")
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Settings")
            .toolbarBackground(.automatic, in: .navigationBar)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
